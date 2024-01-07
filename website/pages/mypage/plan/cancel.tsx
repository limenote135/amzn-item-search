import { useRefreshUser, useUser } from "@/plugin/auth";
import { getPlanName, PlanNames } from "@/util/plan";
import { Box, Button, CircularProgress, Paper, Typography } from "@mui/material";
import { CancelSubscription, GetNextPayment } from "@/api/stripe";
import { useEffect, useState } from "react";
import { useRouter } from "next/router";

type CancelContainerProps = {
  plan: PlanNames | undefined;
  paymentDate: string;
  onCancel: () => void;
  onBack: () => void;
  isLoading: boolean;
  result: string;
};

const CancelContainer = ({ plan, paymentDate, onBack, onCancel, isLoading, result }: CancelContainerProps) => {
  return (
    <Paper sx={{ maxWidth: 800, mx: "auto", p: 2 }}>
      <Typography variant={"h6"}>現在のプラン: {getPlanName(plan)}</Typography>
      <Box my={2}>
        <p>現在のプランをキャンセルしてフリープランに変更しますか？</p>
        <p>フリープランにすると以降の引き落としは行われませんが、一部の機能が使えなくなります。</p>
        {plan === "campaign" && <p>また、一度キャンセルすると再度キャンペーンプランには変更できません。</p>}
        {paymentDate && <Typography>プランの変更は {paymentDate} に行われます。</Typography>}
      </Box>
      <Box display={"flex"} alignItems={"center"}>
        <Button variant={"contained"} onClick={onBack} sx={{ mx: 1 }}>
          戻る
        </Button>
        <Button variant={"contained"} color={"error"} onClick={onCancel} disabled={isLoading} sx={{ mx: 1 }}>
          キャンセルする
        </Button>
        {isLoading && <CircularProgress sx={{ p: 1 }} />}
      </Box>
      <Typography mt={1}>{result}</Typography>
    </Paper>
  );
};

const Cancel = () => {
  const router = useRouter();
  const [isLoading, setIsLoading] = useState(false);
  const [result, setResult] = useState("");
  const [paymentDate, setPaymentDate] = useState("");
  const user = useUser();
  const refresh = useRefreshUser();
  const plan = user?.claims.plan;

  useEffect(() => {
    const fn = async () => {
      const token = await user?.raw.getIdToken();
      if (!token) {
        return;
      }
      const resp = await GetNextPayment(token);
      const d = new Date(resp.date);
      setPaymentDate(`${d.getMonth() + 1}/${d.getDate()}`);
    };
    fn();
  }, [user]);

  const handleBack = () => router.back();
  const handleCancel = async () => {
    try {
      setIsLoading(true);
      const token = await user?.raw.getIdToken();
      if (!token) {
        return;
      }
      await CancelSubscription(token);
      setResult(`プランをキャンセルしました。`);
      await refresh();
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <CancelContainer
      plan={plan}
      paymentDate={paymentDate}
      onBack={handleBack}
      onCancel={handleCancel}
      isLoading={isLoading}
      result={result}
    />
  );
};

Cancel.title = "プランの解約";

export default Cancel;
