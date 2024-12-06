import { Box, Button, CircularProgress, TextField, Typography } from "@mui/material";
import React, { FormEvent, useRef, useState } from "react";
import { useUser } from "@/plugin/auth";
import { SendSupport } from "@/plugin/functions";

export const Inquiry = () => {
  const user = useUser();

  const emailRef = useRef<HTMLInputElement>(null);
  const [email, setEmail] = useState(user?.mail ?? "");
  const [content, setContent] = useState("");
  const [env, setEnv] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState("");

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      setIsLoading(true);
      setMessage("");
      const ua = window.navigator.userAgent;
      await SendSupport(email, content, env, ua);
      setMessage("問い合わせを受け付けました。数日以内にご連絡いたします。");
    } finally {
      setIsLoading(false);
    }
  };

  const isEmailValid = emailRef?.current?.validity.valid ?? true;

  return (
    <Box component={"form"} onSubmit={handleSubmit}>
      <Typography sx={{ my: 1, fontWeight: "bold" }}>
        アプリの動作に関するお問い合わせはアプリ内から行ってください。
      </Typography>
      <Typography>アプリ内から行うと、端末やアプリのバージョン等の情報が自動的に収集されます。</Typography>
      <Typography>これらの情報が無い場合、サポートしかねる場合があります。</Typography>
      <Typography sx={{ mt: 2 }}>
        iCloud メールなどで弊社からの返答が迷惑メールフォルダに分類される場合がございます。
      </Typography>
      <Typography>返答が来ない場合、迷惑メールフォルダに含まれていないかもご確認ください</Typography>
      <Box mb={2} mt={4}>
        <TextField
          required
          fullWidth
          label={"メールアドレス"}
          inputRef={emailRef}
          value={email}
          error={!isEmailValid}
          helperText={!isEmailValid && emailRef?.current?.validationMessage}
          onChange={e => setEmail(e.target.value)}
          type={"email"}
        ></TextField>
      </Box>
      <Box my={2}>
        <TextField
          fullWidth
          label={"内容"}
          multiline
          rows={10}
          InputLabelProps={{ shrink: true }}
          placeholder={"行った操作、出ているエラーメッセージ等なるべく詳しくお書きください"}
          onChange={e => setContent(e.target.value)}
        ></TextField>
      </Box>
      <Box my={2}>
        <TextField
          fullWidth
          label={"環境"}
          multiline
          rows={4}
          placeholder={"お使いのOS、ブラウザおよびバージョン等"}
          InputLabelProps={{ shrink: true }}
          onChange={e => setEnv(e.target.value)}
        ></TextField>
      </Box>
      <Box display={"flex"} alignItems={"center"}>
        <Button variant={"contained"} type={"submit"} disabled={!isEmailValid || !content}>
          送信
        </Button>
        {isLoading && <CircularProgress sx={{ p: 1 }} />}
      </Box>
      <Box mt={1}>{message}</Box>
    </Box>
  );
};
