import { Image } from "@/components/Image";
import GoogleButton from "@/assets/google_btn.png";
import AppleButton from "@/assets/apple_btn.png";
import React, { FormEvent, useEffect, useMemo, useState } from "react";
import { loginWithGoogle, loginWithEmail, useUser, loginWithApple } from "@/plugin/auth";
import { useRouter } from "next/router";
import { Box, Button, CircularProgress, Paper, TextField, Typography } from "@mui/material";
import { FirebaseError } from "@firebase/app";
import Link from "@/components/Link";
import Menu from "@/components/lp/Menu";
import { parser } from "@/plugin/budoux";

type Props = {
  isLoading: boolean;
  error: string;
  onLoginButtonClick: (email: string, password: string) => void;
  onGoogleLoginButtonClicked: () => void;
  onAppleLoginButtonClicked: () => void;
};

const LoginContainer = ({
  isLoading,
  error,
  onLoginButtonClick,
  onGoogleLoginButtonClicked,
  onAppleLoginButtonClicked,
}: Props) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const isButtonDisabled = useMemo(() => {
    return !email || !password || isLoading;
  }, [email, password, isLoading]);

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    onLoginButtonClick(email, password);
  };

  return (
    <Paper sx={{ maxWidth: 600, mx: "auto", textAlign: "center", mt: 4 }}>
      <Box p={2} component={"form"} onSubmit={handleSubmit}>
        <Typography
          dangerouslySetInnerHTML={{
            __html: parser.translateHTMLString("アマサーチのアカウントでログインしてください"),
          }}
        />
        <Typography
          dangerouslySetInnerHTML={{
            __html: parser.translateHTMLString("お持ちでない方は、アプリ内から新規作成してください"),
          }}
        />
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
        <Box display={"flex"} justifyContent={"center"} alignItems={"center"}>
          <Button variant="contained" type={"submit"} disabled={isButtonDisabled}>
            ログイン
          </Button>
          {isLoading && <CircularProgress sx={{ p: 1 }} />}
        </Box>
        {error && (
          <Typography sx={{ mt: 1 }} color={"red"}>
            エラー: {error}
          </Typography>
        )}
        <Box mt={1}>
          パスワードを忘れた場合は
          <Link href={"./login/reset"}>
            <Typography component={"span"} sx={{ textDecoration: "underline" }} color={"blue"}>
              こちら
            </Typography>
          </Link>
        </Box>
      </Box>
      <div>または</div>
      <div>
        <Image src={GoogleButton} alt={""} onClick={onGoogleLoginButtonClicked} loading={"eager"} />
      </div>
      <div>
        <Image src={AppleButton} alt={""} onClick={onAppleLoginButtonClicked} loading={"eager"} />
      </div>
    </Paper>
  );
};

const LoginPage = () => {
  const user = useUser();
  const router = useRouter();
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const firebaseHandler = async (fn: () => Promise<void>) => {
    try {
      setIsLoading(true);
      setError("");
      await fn();
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

  const handleLogin = async (email: string, password: string) => {
    await firebaseHandler(async () => {
      await loginWithEmail(email, password);
    });
  };

  const handleGoogleLogin = async () => {
    await firebaseHandler(async () => {
      await loginWithGoogle();
    });
  };

  const handleAppleLogin = async () => {
    await firebaseHandler(async () => {
      await loginWithApple();
    });
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
    <>
      <Menu />
      <main>
        <LoginContainer
          isLoading={isLoading}
          error={error}
          onLoginButtonClick={handleLogin}
          onGoogleLoginButtonClicked={handleGoogleLogin}
          onAppleLoginButtonClicked={handleAppleLogin}
        ></LoginContainer>
      </main>
    </>
  );
};

export default LoginPage;
