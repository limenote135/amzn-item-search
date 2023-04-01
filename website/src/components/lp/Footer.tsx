import { Box, Button, Typography } from "@mui/material";
import React from "react";
import { Image } from "@/components/Image";
import Link from "@/components/Link";

import WhiteLogo from "@/assets/lp/logo_w.png";

const returnToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

type FooterProps = {
  returnToTop: () => void;
};

const FooterContainer = ({ returnToTop }: FooterProps) => (
  <Box component={"footer"} textAlign={"center"} bgcolor={"#000"} color={"#fff"}>
    <Box py={3}>
      <Button variant={"text"} onClick={returnToTop} color={"inherit"}>
        ▲ RETURN
      </Button>
    </Box>
    <Box display={"inline-block"}>
      <Box display={"flex"} justifyContent={"center"} alignItems={"center"} flexDirection={{ xs: "column", md: "row" }}>
        <Box sx={{ cursor: "pointer" }} order={{ xs: 2, md: 1 }}>
          <Image src={WhiteLogo} width={240} height={67} onClick={returnToTop} alt={"トップへ戻る"} />
        </Box>
        <Box
          display={"flex"}
          flexDirection={"column"}
          textAlign={{ xs: "center", md: "left" }}
          py={1}
          ml={{ xs: 0, md: 4 }}
          order={{ xs: 1, md: 2 }}
        >
          <Link href={"/terms/service"}>
            <Typography my={1}>利用規約</Typography>
          </Link>
          <Link href={"/terms/privacy"}>
            <Typography my={1}>プライバシーポリシー</Typography>
          </Link>
          <Link href={"/terms/law"}>
            <Typography my={1}>特定商取引法に基づく表記</Typography>
          </Link>
          <Link href={"/contact"}>
            <Typography my={1}>お問い合わせ</Typography>
          </Link>
        </Box>
      </Box>
    </Box>
    <Typography variant={"body2"}>Copyright&copy; Amasearch. All Right Reserved.</Typography>
  </Box>
);

const Footer = () => {
  return <FooterContainer returnToTop={returnToTop} />;
};

export default Footer;
