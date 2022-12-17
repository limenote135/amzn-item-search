import { GetStaticProps } from "next";
import { Container, Typography } from "@mui/material";
import Menu from "@/components/lp/Menu";
import fs from "fs";
import { ReactElement } from "react";

type Props = {
  terms: string;
};

export const getStaticProps: GetStaticProps = async context => {
  const data = fs.readFileSync("./public/terms/terms_of_service.txt", "utf8");
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
      <Menu />
      <Container maxWidth={"lg"}>
        <Typography variant={"body1"} dangerouslySetInnerHTML={{ __html: terms }} mt={2} />
      </Container>
    </>
  );
};

Terms.getLayout = (page: ReactElement) => page;

export default Terms;
