import { NextPage } from "next";
import { Image } from "@/components/Image";
import GoogleButton from "@/assets/google_btn.png";
import React, { useEffect, useState } from "react";
import { loginWithGoogle, loginWithEmail, useUser } from "@/plugin/auth";
import { useRouter } from "next/router";
import { Box, Button, TextField } from "@mui/material";

type Props = {
  onLoginButtonClick: (email: string, password: string) => void;
  onGoogleLoginButtonClicked: () => void;
};

const LoginContainer = ({ onLoginButtonClick, onGoogleLoginButtonClicked }: Props) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  return (
    <Box p={2}>
      <div>ログインしてください</div>
      <p>
        <TextField
          id="standard-basic"
          label="email"
          variant="standard"
          value={email}
          onChange={e => setEmail(e.target.value)}
        />
      </p>
      <p>
        <TextField
          id="standard-basic"
          label="password"
          variant="standard"
          type="password"
          value={password}
          onChange={e => setPassword(e.target.value)}
        />
      </p>
      <p>
        <Button variant="contained" onClick={() => onLoginButtonClick(email, password)}>
          Login
        </Button>
      </p>
      <Image src={GoogleButton} alt={""} onClick={onGoogleLoginButtonClicked} />
    </Box>
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
    <LoginContainer onLoginButtonClick={handleLogin} onGoogleLoginButtonClicked={handleGoogleLogin}></LoginContainer>
  );
};

export default Login;
