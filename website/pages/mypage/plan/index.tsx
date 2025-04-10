import {
  Box,
  Button,
  CircularProgress,
  FormControl,
  FormControlLabel,
  FormLabel,
  Paper,
  Radio,
  RadioGroup,
  Typography,
} from "@mui/material";
import { ChangeEvent, useState } from "react";
import { useUser } from "@/plugin/auth";
import { useRouter } from "next/router";
import { getPlanName, isPaidUser, PlanNames } from "@/util/plan";

function isDisabled(plan: PlanNames | undefined, value: string) {
  if (plan === value) {
    return true;
  }
  switch (plan) {
    case "trial":
      return value === "free";
    case "standard":
    case "campaign":
    case "suspended":
      return value === "standard" || value === "campaign";
  }
  return false;
}

const Index = () => {
  const user = useUser();
  const router = useRouter();
  const [value, setValue] = useState("free");
  const [loading, setLoading] = useState(false);

  const plan = user?.claims.plan;
  const trialDue = user && new Date(user.claims.trial * 1000);
  const inTrial = trialDue ? trialDue.getTime() > Date.now() : false;

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    setValue((event.target as HTMLInputElement).value);
  };

  const handleClick = () => {
    try {
      setLoading(true);
      if (value === "free") {
        router.push("./plan/cancel");
        return;
      }
      router.push(`./plan/subscription?plan=${value}`);
    } finally {
      setLoading(false);
    }
  };

  if (!user?.verified) {
    return (
      <>
        <p>メールによる本人確認が済んでいないため、登録できません。</p>
        <p>本人確認後、一度ログアウトして再ログインしてください。</p>
      </>
    );
  }

  if (user?.claims.lwa !== true && !isPaidUser(plan)) {
    const t = new Date(user?.createdAt ?? 0);
    return (
      <>
        <p>Amazon 連携されていないため、登録できません。</p>
        <p>連携完了後、一度ログアウトして再ログインしてください。</p>
        <p>現在のアカウント: {user?.mail}</p>
        <p>
          アカウント作成日: {t.getFullYear()}/{t.getMonth() + 1}/{t.getDate()}
        </p>
      </>
    );
  }
  return (
    <Paper sx={{ maxWidth: 800, mx: "auto", p: 3 }}>
      <p>現在のプラン: {getPlanName(plan)}</p>
      {trialDue && inTrial && (
        <Box my={1}>
          無料期間が残っているため、支払いは
          {`${trialDue.getFullYear()}/${trialDue.getMonth() + 1}/${trialDue.getDate()}`} に行われます。
        </Box>
      )}
      <FormControl>
        <FormLabel id="demo-controlled-radio-buttons-group">プランを選択</FormLabel>
        <RadioGroup name="controlled-radio-buttons-group" value={value} onChange={handleChange}>
          <FormControlLabel
            value="free"
            sx={{ my: 2 }}
            control={<Radio />}
            label={
              <>
                <Typography variant={"h6"}>フリープラン</Typography>
                <Typography>一部機能がご利用いただけません。</Typography>
              </>
            }
          />
          <FormControlLabel
            value="standard"
            sx={{ my: 2 }}
            control={<Radio />}
            label={
              <>
                <Typography variant={"h6"} sx={{ wordBreak: "keep-all" }}>
                  標準プラン <wbr />
                  月額2,980円
                </Typography>
                <Typography>すべての機能が利用いただけます。</Typography>
              </>
            }
          />
        </RadioGroup>
      </FormControl>
      <Box display={"flex"} mt={2}>
        <Button variant={"contained"} disabled={isDisabled(plan, value) || loading} onClick={handleClick}>
          次に進む
        </Button>
        {loading && <CircularProgress sx={{ p: 1 }} />}
      </Box>
    </Paper>
  );
};

Index.title = "プランの変更";

export default Index;
