import { FormEvent, useEffect, useState } from "react";
import { useUser } from "@/plugin/auth";
import { CreateCard, GetNextPayment, stripePromise, UpdateCard } from "@/api/stripe";
import { Elements, PaymentElement, useElements, useStripe } from "@stripe/react-stripe-js";
import { Loading } from "@/components/core/Loading";
import { Box, Button, CircularProgress, Paper, Typography } from "@mui/material";

const Information = () => {
  const user = useUser();
  const [cardInfo, setCardInfo] = useState("");
  const [nextPayment, setNextPayment] = useState("");

  useEffect(() => {
    (async () => {
      const token = await user?.raw.getIdToken();
      if (!token) {
        setCardInfo("取得エラー");
        return;
      }
      const data = await GetNextPayment(token);
      if (data.brand === "") {
        setCardInfo("未登録");
        setNextPayment(" - ");
      } else {
        setCardInfo(`${data.brand} 下4桁: ${data.number}`);
        if (data.cancelAt) {
          const cancelAt = new Date(data.cancelAt);
          setNextPayment(`無し( ${cancelAt.getFullYear()}/${cancelAt.getMonth() + 1}/${cancelAt.getDate()} で終了)`);
        } else {
          const d = new Date(data.date);
          setNextPayment(`${d.getFullYear()}/${d.getMonth() + 1}/${d.getDate()}`);
        }
      }
    })();
  }, [user]);
  return (
    <Box my={1}>
      <Typography my={1}>現在のカード: {cardInfo}</Typography>
      <Typography my={1}>{nextPayment} の決済より新しいカードが使われます。</Typography>
      <Typography my={1}>現在の決済が失敗している場合、更新後に自動的に決済が再試行されます。</Typography>
    </Box>
  );
};

const InputForm = () => {
  const [message, setMessage] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);

  const user = useUser();

  const stripe = useStripe();
  const elements = useElements();
  if (!stripe || !elements) {
    return <Loading />;
  }
  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    setIsLoading(true);
    e.preventDefault();
    setMessage("");
    try {
      const token = await user?.raw.getIdToken();
      if (!token) {
        return;
      }
      const resp = await stripe.confirmSetup({
        elements: elements,
        redirect: "if_required",
        confirmParams: {
          payment_method_data: { billing_details: { address: { country: "JP" } } },
        },
      });

      if (resp.error) {
        const code = resp.error.code;
        if (code === "setup_intent_unexpected_state") {
          setMessage("エラーが発生しました。ページを再読み込みして始めからやり直してください");
        } else {
          setMessage(resp.error.message ?? "");
        }
        setIsLoading(false);
        return;
      }
      const method = resp.setupIntent.payment_method as string;
      await UpdateCard(token, method);
      setMessage("カードの更新が完了しました");
      setIsCompleted(true);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Paper variant="outlined" sx={{ maxWidth: 500, mx: "auto", p: 2 }}>
      <Information />
      <form onSubmit={handleSubmit}>
        <PaymentElement options={{ fields: { billingDetails: { address: { country: "never" } } } }} />
        <Box display={"flex"} alignItems={"end"}>
          <Button type="submit" variant="contained" sx={{ mt: 2 }} disabled={isLoading || isCompleted}>
            カードを更新する
          </Button>
          {isLoading && <CircularProgress sx={{ p: 1 }} />}
        </Box>
        <div>{message}</div>
      </form>
    </Paper>
  );
};

const CardChangePage = () => {
  const [secret, setSecret] = useState("");

  const user = useUser();
  useEffect(() => {
    const createSetupIntent = async () => {
      const token = await user?.raw.getIdToken();
      if (!token) {
        return;
      }
      const resp = await CreateCard(token);
      setSecret(resp);
    };
    createSetupIntent();
  }, [user]);

  if (!secret) {
    return <Loading />;
  }

  return (
    <Elements stripe={stripePromise} options={{ clientSecret: secret }}>
      <InputForm />
    </Elements>
  );
};

CardChangePage.title = "支払い方法変更";

export default CardChangePage;
