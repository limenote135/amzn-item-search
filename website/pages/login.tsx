import { NextPage } from "next";
import { Image } from "@/components/Image";
import GoogleButton from "@/assets/google_btn.png";
import React, { useEffect } from "react";
import { login, useUser } from "@/plugin/auth";
import { useRouter } from "next/router";
import { Box } from "@mui/material";

type Props = {
  onLoginButtonClick: () => void;
};

const LoginContainer = ({ onLoginButtonClick }: Props) => (
  <Box p={2}>
    <div>ログインしてください</div>
    <Image src={GoogleButton} alt={""} onClick={onLoginButtonClick} />
  </Box>
);

const Login: NextPage = () => {
  const user = useUser();
  const router = useRouter();

  const handleLogin = () => {
    login().catch((e: any) => console.error(e));
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

  return <LoginContainer onLoginButtonClick={handleLogin}></LoginContainer>;
};

export default Login;
