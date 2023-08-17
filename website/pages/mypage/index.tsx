import { Alert, AlertTitle } from "@mui/material";

const MyPage = () => {
  return (
    <>
      <Alert severity="info">
        <AlertTitle>お知らせ</AlertTitle>
        <p>8/26 ～ 9/4 まで弊社休業期間となります。</p>
        <p>期間内にいただきましたお問い合わせはこれ以降のご返答となりますのでご了承ください。</p>
      </Alert>
    </>
  );
};

MyPage.title = "マイページ";

export default MyPage;
