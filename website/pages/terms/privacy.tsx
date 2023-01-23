import fs from "fs";
import { GetStaticProps } from "next";
import { Container, Typography } from "@mui/material";
import Menu from "@/components/lp/Menu";
import { ReactElement } from "react";
import Head from "next/head";

type Props = {
  terms: string;
};

export const getStaticProps: GetStaticProps = async context => {
  const data = fs.readFileSync("./public/terms/privacy_policy.txt", "utf8");
  const terms = data.replaceAll("\n", "<br/>\n");
  return {
    props: {
      terms,
    },
  };
};

const Terms = ({ terms }: Props) => {
  return (
    <>
      <Head>
        <title>{"プライバシーポリシー"}</title>
      </Head>
      <Menu />
      <Container maxWidth={"lg"}>
        <Typography variant={"body1"} dangerouslySetInnerHTML={{ __html: terms }} mt={2} />
      </Container>
    </>
  );
};

Terms.getLayout = (page: ReactElement) => page;

export default Terms;
