import { useRefreshUser } from "@/plugin/auth";
import { useEffect } from "react";
import { Box, Typography } from "@mui/material";
import Link from "@/components/Link";

const Success = () => {
  const refresher = useRefreshUser();

  useEffect(() => {
    (async () => {
      refresher();
    })();
  }, []);

  return (
    <Box maxWidth={800} mx={"auto"} textAlign={"center"}>
      <Typography variant={"h5"} my={2}>
        プランの変更が完了しました
      </Typography>
      <Box>ご利用ありがとうございます。</Box>
      <Box>
        現在の契約状況は
        <Link href={"../user"}>
          <Typography component={"span"} sx={{ textDecoration: "underline" }} color={"blue"}>
            こちら
          </Typography>
        </Link>
        よりご確認いただけます。
      </Box>
      <Box>アプリ側で反映されていない場合は、少し時間を置くか一度ログアウトしていただくようにお願いいたします。</Box>
    </Box>
  );
};

export default Success;
