import { Alert, AlertTitle } from "@mui/material";

const MyPage = () => {
  return (
    <>
      <Alert severity="info">
        <AlertTitle>お知らせ</AlertTitle>
        <p>
          特に iCloud のメールアドレスを利用の場合、弊社からのメールが迷惑メールフォルダに分類される場合がございます。
        </p>
        <p>お問い合わせに対して返答が来ない場合、迷惑メールに分類されていないかもご確認ください。</p>
      </Alert>
    </>
  );
};

MyPage.title = "マイページ";

export default MyPage;
