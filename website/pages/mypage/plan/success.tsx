import { useRefreshUser } from "@/plugin/auth";
import { useEffect } from "react";
import { Box, Typography } from "@mui/material";
import Link from "@/components/Link";
import { parser } from "@/plugin/budoux";

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
      <Box my={2}>ご利用ありがとうございます。</Box>
      <Typography
        dangerouslySetInnerHTML={{
          __html: parser.translateHTMLString(
            "アプリ側で反映されていない場合は、少し時間を置いた後に再起動していただくか、一度ログアウトしていただくようにお願いいたします。"
          ),
        }}
      />
      <Box my={2}>
        現在の契約状況は
        <Link href={"../user"}>
          <Typography component={"span"} sx={{ textDecoration: "underline" }} color={"blue"}>
            こちら
          </Typography>
        </Link>
        よりご確認いただけます。
      </Box>
    </Box>
  );
};

export default Success;
