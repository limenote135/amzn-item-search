import { NextPage } from "next";
import { Image } from "@/components/Image";
import GoogleButton from "@/assets/google_btn.png";
import AppleButton from "@/assets/apple_btn.png";
import React, { FormEvent, useEffect, useMemo, useState } from "react";
import { loginWithGoogle, loginWithEmail, useUser, loginWithApple } from "@/plugin/auth";
import { useRouter } from "next/router";
import { Box, Button, Paper, TextField } from "@mui/material";

type Props = {
  onLoginButtonClick: (email: string, password: string) => void;
  onGoogleLoginButtonClicked: () => void;
  onAppleLoginButtonClicked: () => void;
};

const LoginContainer = ({ onLoginButtonClick, onGoogleLoginButtonClicked, onAppleLoginButtonClicked }: Props) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const isButtonDisabled = useMemo(() => {
    return !email || !password;
  }, [email, password]);

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    onLoginButtonClick(email, password);
  };

  return (
    <Paper sx={{ maxWidth: 600, mx: "auto", textAlign: "center", mt: 4 }}>
      <Box p={2} component={"form"} onSubmit={handleSubmit}>
        <div>アマサーチのアカウントでログインしてください</div>
        <div>お持ちでない方は、アプリ内から新規作成してください</div>
        <div>
          <TextField
            label="メールアドレス"
            variant="standard"
            sx={{ width: "30ch", my: 1 }}
            value={email}
            onChange={e => setEmail(e.target.value)}
          />
        </div>
        <div>
          <TextField
            label="パスワード"
            variant="standard"
            type="password"
            sx={{ width: "30ch", my: 1 }}
            value={password}
            onChange={e => setPassword(e.target.value)}
          />
        </div>
        <div>
          <Button
            variant="contained"
            type={"submit"}
            onSubmit={() => onLoginButtonClick(email, password)}
            disabled={isButtonDisabled}
          >
            ログイン
          </Button>
        </div>
      </Box>
      <div>または</div>
      <div>
        <Image src={GoogleButton} alt={""} onClick={onGoogleLoginButtonClicked} />
      </div>
      <div>
        <Image src={AppleButton} alt={""} onClick={onAppleLoginButtonClicked} />
      </div>
    </Paper>
  );
};

const Login: NextPage = () => {
  const user = useUser();
  const router = useRouter();

  const handleLogin = (email: string, password: string) => {
    console.log(email, password);
    loginWithEmail(email, password);
  };

  const handleGoogleLogin = () => {
    loginWithGoogle().catch((e: any) => console.error(e));
  };

  const handleAppleLogin = () => {
    loginWithApple().catch((e: any) => console.error(e));
  };

  useEffect(() => {
    if (user) {
      const query = router.query;
      if (query && query.ref) {
        router.replace(query.ref as string);
        return;
      }
      router.replace("/mypage");
    }
  }, [user, router]);

  return (
    <LoginContainer
      onLoginButtonClick={handleLogin}
      onGoogleLoginButtonClicked={handleGoogleLogin}
      onAppleLoginButtonClicked={handleAppleLogin}
    ></LoginContainer>
  );
};

export default Login;
