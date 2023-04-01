import Menu from "@/components/lp/Menu";
import { Container, Typography } from "@mui/material";
import { styled } from "@mui/system";
import Head from "next/head";
import { ReactElement } from "react";

const Table = styled("table")`
  margin: auto;
  border-collapse: collapse;
  line-height: 1.5;
`;

const Td = styled("td")`
  border: 1px solid;
`;

const Law = () => {
  return (
    <>
      <Head>
        <title>{"特定商取引法に基づく表記"}</title>
      </Head>
      <Menu />
      <Container maxWidth={"lg"}>
        <Typography variant={"h6"} my={4} textAlign={"center"}>
          特定商取引法に基づく表記
        </Typography>
        <Table cellPadding={8}>
          <tbody>
            <tr>
              <Td>販売業者の正式名称</Td>
              <Td>Kenz Creation</Td>
            </tr>
            <tr>
              <Td>所在地</Td>
              <Td>京都府京都市下京区朱雀宝蔵町44</Td>
            </tr>
            <tr>
              <Td>電話番号</Td>
              <Td>050-5360-9196</Td>
            </tr>
            <tr>
              <Td>メールアドレス</Td>
              <Td>support@mail.knz-c.com</Td>
            </tr>
            <tr>
              <Td>運営統括責任者</Td>
              <Td>北山 博之</Td>
            </tr>
            <tr>
              <Td>商品代金以外の必要料金</Td>
              <Td>無し</Td>
            </tr>
            <tr>
              <Td>返品・交換の方法</Td>
              <Td>
                当社が契約者の申込内容と異なるサービスをお客様に提供した場合を除き、返品・キャンセルはできません。
              </Td>
            </tr>
            <tr>
              <Td>引渡し時期</Td>
              <Td>決済と同時に利用可能となります。</Td>
            </tr>
            <tr>
              <Td>お支払い方法</Td>
              <Td>クレジットカード</Td>
            </tr>
            <tr>
              <Td>支払い時期</Td>
              <Td>各カード会社引き落とし日</Td>
            </tr>
            <tr>
              <Td>販売価格</Td>
              <Td>月額2,980円(キャンペーンプランは月額1,980円)</Td>
            </tr>
          </tbody>
        </Table>
      </Container>
    </>
  );
};

Law.getLayout = (page: ReactElement) => page;

export default Law;
