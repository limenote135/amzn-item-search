import { Alert, AlertTitle } from "@mui/material";

const MyPage = () => {
  return (
    <>
      <Alert severity="info">
        <AlertTitle>お知らせ</AlertTitle>
        <p>重要なお知らせはありません</p>
      </Alert>
    </>
  );
};

MyPage.title = "マイページ";

export default MyPage;
