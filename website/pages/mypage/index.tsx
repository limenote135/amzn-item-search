import { Alert, AlertTitle } from "@mui/material";

const MyPage = () => {
  return (
    <>
      <Alert severity="info">
        <AlertTitle>お知らせ</AlertTitle>
        <p>12/30 ～ 1/5 まで弊社休業期間のため、お問い合わせへの返答はそれ以降となります。ご了承ください。</p>
      </Alert>
    </>
  );
};

MyPage.title = "マイページ";

export default MyPage;
