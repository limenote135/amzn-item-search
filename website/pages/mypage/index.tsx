import { Alert, AlertTitle } from "@mui/material";

const MyPage = () => {
  return (
    <>
      <Alert severity="info">
        <AlertTitle>お知らせ</AlertTitle>
        <p>5/1 から有料プランが導入されます。</p>
        <p>フリープランの場合、一部機能が制限されるためご注意ください。</p>
        <p>また、5/31 までの期間限定で月額利用料がずっと1,980円のキャンペーンプランに切り替えることが可能です。</p>
      </Alert>
    </>
  );
};

export default MyPage;
