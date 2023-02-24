import { Box, Button, CircularProgress, Typography } from "@mui/material";
import { useState } from "react";
import { DisableUser } from "@/plugin/functions";
import { logout } from "@/plugin/auth";

export const Leave = () => {
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState("");

  const handleDelete = async () => {
    try {
      setIsLoading(true);
      await DisableUser();
      setMessage("アカウントを削除しました。ご利用ありがとうございました。");
      setTimeout(() => {
        logout();
      }, 3000);
    } catch (e) {
      if (e instanceof Error) {
        setMessage(`エラー: ${e.message}`);
      }
      throw e;
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <>
      <Typography variant={"h6"} py={1}>
        本当にアカウントを削除してよいですか？
      </Typography>
      <Typography>アカウントを削除すると、同じメールアドレスで再登録はできません。</Typography>
      <Typography>また、契約中のプランは即座に解約されます。</Typography>
      <Box display={"flex"} alignItems={"center"}>
        <Button variant={"contained"} color={"error"} sx={{ my: 1 }} onClick={handleDelete}>
          理解して削除する
        </Button>
        {isLoading && <CircularProgress sx={{ p: 1 }} />}
      </Box>
      <Box>{message}</Box>
    </>
  );
};
