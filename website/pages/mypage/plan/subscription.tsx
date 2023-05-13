import { FormEvent, useEffect, useState } from "react";
import { Box, Button, CircularProgress, Paper, Typography } from "@mui/material";
import { Elements, PaymentElement, useElements, useStripe } from "@stripe/react-stripe-js";
import { CreateCard, CreateSubscription, stripePromise } from "@/api/stripe";
import { useRouter } from "next/router";
import { Loading } from "@/components/core/Loading";
import { useUser } from "@/plugin/auth";
import { parser } from "@/plugin/budoux";

type InputFormProps = {
  plan: string;
};

const InputForm = ({ plan }: InputFormProps) => {
  const [message, setMessage] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const router = useRouter();
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
        setIsLoading(false);
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
        setMessage(resp.error.message ?? "");
        setIsLoading(false);
        return;
      }
      const method = resp.setupIntent.payment_method as string;
      await CreateSubscription(token, { Plan: plan, PaymentMethod: method });
      let timerId = setInterval(async () => {
        const token = await user?.raw.getIdTokenResult(true);
        if (token?.claims.pl !== "free") {
          clearInterval(timerId);
          setIsLoading(false);
          router.replace("./success");
        }
      }, 1000);
    } catch (e) {
      if (e instanceof Error) {
        setMessage("エラー:" + e.message);
        setIsLoading(false);
      }
      throw e;
    }
  };

  return (
    <Paper variant="outlined" sx={{ maxWidth: 500, mx: "auto", p: 2 }}>
      <form onSubmit={handleSubmit}>
        <PaymentElement options={{ fields: { billingDetails: { address: { country: "never" } } } }} />
        <Box display={"flex"} alignItems={"end"}>
          <Button type="submit" variant="contained" sx={{ mt: 2 }} disabled={isLoading}>
            支払いを行う
          </Button>
          {isLoading && <CircularProgress sx={{ p: 1 }} />}
        </Box>
        <div>{message}</div>
      </form>
    </Paper>
  );
};

function getPlanName(plan: string) {
  switch (plan) {
    case "standard":
      return "標準プラン 月額 2,980円";
    case "campaign":
      return "キャンペーンプラン 月額 1,980円";
  }
  return "不明なプラン";
}

type InformationProps = {
  plan: string;
  trialDue: Date | null;
};

const Information = ({ plan, trialDue }: InformationProps) => {
  const inTrial = trialDue ? trialDue.getTime() > Date.now() : false;
  const payDate = inTrial
    ? ` ${trialDue!.getFullYear()}/${trialDue!.getMonth() + 1}/${trialDue!.getDate()} `
    : " 即座 ";

  return (
    <>
      <Box textAlign={"center"} my={1} mx={"auto"} maxWidth={600}>
        <Typography variant={"h6"} fontWeight={"bold"} my={2}>
          {getPlanName(plan)}
        </Typography>
        <Typography> カード情報を入力してください。</Typography>
        <Typography>支払いは{payDate}に行われ、以降は1ヶ月ごとに自動で決済されます。</Typography>
        {plan === "campaign" && (
          <Typography
            mt={1}
            variant={"body2"}
            dangerouslySetInnerHTML={{
              __html: parser.translateHTMLString(
                "キャンペーンプランに変更後、手動であるいは決済失敗等によりフリープランに変更された場合、" +
                  "再度キャンペーンプランへの変更はできませんのでご注意ください。"
              ),
            }}
          />
        )}
      </Box>
    </>
  );
};

type SubscriptionProps = {
  plan: string;
  onBack: () => void;
};

const Subscription = ({ plan, onBack }: SubscriptionProps) => {
  const [secret, setSecret] = useState("");
  const [error, setError] = useState("");

  const user = useUser();
  const trialDue = user && new Date(user.claims.trial * 1000);

  useEffect(() => {
    const createSetupIntent = async () => {
      try {
        const token = await user?.raw.getIdToken();
        if (!token) {
          return;
        }
        const resp = await CreateCard(token);
        setSecret(resp);
      } catch (e) {
        if (e instanceof Error) {
          setError(e.message);
        }
        throw e;
      }
    };
    createSetupIntent();
  }, [user]);

  if (!secret) {
    return <Loading />;
  }

  if (error) {
    return <ShowErrorContainer onBack={onBack} message={error} />;
  }

  return (
    <>
      <Information plan={plan} trialDue={trialDue} />
      <Elements stripe={stripePromise} options={{ clientSecret: secret }}>
        <InputForm plan={plan} />
      </Elements>
    </>
  );
};

type ShowErrorContainerProps = {
  message?: string;
  onBack: () => void;
};

const ShowErrorContainer = ({ message, onBack }: ShowErrorContainerProps) => (
  <Box>
    <Typography>エラーが発生しました。もう一度やり直してください。</Typography>
    {message && <Typography>{message}</Typography>}
    <Button variant={"contained"} onClick={onBack}>
      戻る
    </Button>
  </Box>
);

const RootContainer = () => {
  const router = useRouter();
  const query = router.query;

  const handleOnBack = () => {
    router.replace("../plan");
  };

  if (!query || !query.plan) {
    return <ShowErrorContainer onBack={handleOnBack} />;
  }

  return <Subscription plan={query.plan as string} onBack={handleOnBack} />;
};
export default RootContainer;
