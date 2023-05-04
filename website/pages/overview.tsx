import Menu from "@/components/lp/Menu";
import { Container, Typography } from "@mui/material";
import Link from "@/components/Link";
import Footer from "@/components/lp/Footer";
import React, { ReactElement } from "react";
import Head from "next/head";

const TextContainer = ({ children }: { children: JSX.Element }) => {
  return <Container sx={{ ml: 1 }}>{children}</Container>;
};

const Overview = () => {
  return (
    <>
      <Head>
        <meta name="robots" content="noindex" />
      </Head>
      <Menu />
      <Container maxWidth={"lg"}>
        <Typography variant={"h5"} sx={{ my: 1 }}>
          サービス概要
        </Typography>
        <Typography variant={"h6"}>サービス名</Typography>
        <TextContainer>
          <p>アマサーチ</p>
        </TextContainer>
        <Typography variant={"h6"}>サービス詳細</Typography>
        <TextContainer>
          <>
            <p>
              アマサーチは、Amazon
              で商品を販売している事業者向けに商品のリサーチや仕入れ判断のサポートを行うサービスです。
              <br />
              (Amazon の大口セラー契約を行っている方のみが利用可能です)
            </p>
            <p>
              機能の詳細はこちらの<Link href={"/"}>機能概要</Link>をご覧ください。
            </p>
          </>
        </TextContainer>
        <Typography variant={"h6"}>サービスの価格</Typography>
        <TextContainer>
          <>
            <p>1ヶ月あたり2,980円のサブスクリプションサービスです。</p>
            <p>初回決済日から1ヶ月ごとに決済が行われます。</p>
            <p>キャンペーン期間中は1ヶ月あたり1,980円となります。</p>
          </>
        </TextContainer>
        <Typography variant={"h6"}>サービスの利用方法</Typography>
        <TextContainer>
          <>
            <p>以下の各アプリストアよりダウンロードしてください。</p>
            <p>
              <Link href={"https://apps.apple.com/jp/app/id1608782445"} target="_blank" rel="noopener noreferrer">
                iOS
              </Link>{" "}
              /{" "}
              <Link
                href={"https://play.google.com/store/apps/details?id=com.knzc.app.amasearch"}
                target="_blank"
                rel="noopener noreferrer"
              >
                Android
              </Link>
            </p>
          </>
        </TextContainer>
        <Typography variant={"h6"}>支払い方法</Typography>
        <TextContainer>
          <p>クレジットカードによる決済</p>
        </TextContainer>
        <Typography variant={"h6"}>サポート方法</Typography>
        <TextContainer>
          <p>
            アプリ内のお問い合わせ画面、下記メールアドレス、あるいは <Link href={"/contact"}>お問い合わせフォーム</Link>
            からサポートを受け付けます。
          </p>
        </TextContainer>
        <Typography variant={"h6"}>メールアドレス</Typography>
        <TextContainer>
          <p> support@mail.knz-c.com</p>
        </TextContainer>
        <Typography variant={"h6"}>その他規約</Typography>
        <TextContainer>
          <>
            <p>
              <Link href={"/terms/service"}>利用規約</Link>
            </p>
            <p>
              <Link href={"/terms/privacy"}>プライバシーポリシー</Link>
            </p>
            <p>
              <Link href={"/terms/law"}>特定商取引法に基づく表記</Link>
            </p>
          </>
        </TextContainer>
      </Container>
      <Footer />
    </>
  );
};

Overview.getLayout = (page: ReactElement) => page;

export default Overview;
