import Menu from "@/components/lp/Menu";
import { Box, Button, CircularProgress, Paper, TextField, Typography } from "@mui/material";
import React, { FormEvent, useState } from "react";
import { resetPassword } from "@/plugin/auth";
import { FirebaseError } from "@firebase/app";
import { parser } from "@/plugin/budoux";

const ResetPage = () => {
  const [email, setEmail] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError("");
    try {
      setIsLoading(true);
      setError("");
      await resetPassword(email);
    } catch (e) {
      if (e instanceof FirebaseError) {
        switch (e.code) {
          case "auth/invalid-email":
            setError("メールアドレスが正しくありません");
            return;
          case "auth/user-not-found":
            setError("ユーザーが見つかりませんでした");
            return;
          case "auth/user-disabled":
            setError("このユーザーは無効化されているか既に退会しています");
            return;
        }
        setError(`エラー: ${e.code}`);
        return;
      }
      setError("不明なエラー");
      throw e;
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <>
      <Menu />
      <main>
        <Paper sx={{ maxWidth: 700, mx: "auto", textAlign: "center", mt: 4 }}>
          <Box p={2} component={"form"} onSubmit={handleSubmit}>
            <Typography
              dangerouslySetInnerHTML={{
                __html: parser.translateHTMLString("登録したメールアドレスを入力してください。"),
              }}
            />
            <Typography
              dangerouslySetInnerHTML={{
                __html: parser.translateHTMLString(
                  "Googleアカウント/Appleアカウントで登録した場合はこの方法でリセットできません。"
                ),
              }}
            />
            <div>
              <TextField
                label={"メールアドレス"}
                variant={"standard"}
                sx={{ width: "30ch", my: 1 }}
                value={email}
                onChange={e => setEmail(e.target.value)}
              />
            </div>
            <Box display={"flex"} justifyContent={"center"} alignItems={"center"}>
              <Button variant={"contained"} type={"submit"} disabled={!email || isLoading}>
                パスワードをリセット
              </Button>
              {isLoading && <CircularProgress sx={{ p: 1 }} />}
            </Box>
            {error && (
              <Typography sx={{ mt: 1 }} color={"red"}>
                {error}
              </Typography>
            )}
          </Box>
        </Paper>
      </main>
    </>
  );
};

export default ResetPage;
