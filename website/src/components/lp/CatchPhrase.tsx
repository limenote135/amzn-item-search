import { Box, Fade, Typography } from "@mui/material";
import { Image } from "@/components/Image";
import AppDownloadBadge from "@/components/lp/AppDownloadBadge";
import React from "react";
import { useInView } from "react-intersection-observer";
import { ThemeProvider } from "@mui/system";
import { createTheme } from "@mui/material/styles";
import { parser } from "@/plugin/budoux";

import BlackLogo from "@/assets/lp/logo_b.png";
import PersonImg from "@/assets/lp/person.png";

type Props = {
  reference: (node?: Element | null | undefined) => void;
  inView: boolean;
};

const Container = ({ reference, inView }: Props) => (
  <Box bgcolor={"#fedd6b"} textAlign={"center"} py={4} display={"flex"} flexDirection={"column"}>
    <Box display={{ xs: "block", sm: "none" }}>
      <Image src={PersonImg} alt={""} />
    </Box>
    <Typography
      variant={"h4"}
      dangerouslySetInnerHTML={{ __html: parser.translateHTMLString("ゲームを変えるのは、あなた。") }}
    />
    <Box
      my={2}
      display={"flex"}
      justifyContent={"center"}
      alignItems={"center"}
      flexDirection={{ xs: "column", lg: "row" }}
    >
      <Typography variant={"h4"}>これからのせどりは</Typography>
      <Typography variant={"h4"} display={"flex"} alignItems={"center"} ref={reference}>
        <Fade in={inView} timeout={2000}>
          <Box mx={1}>
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <Image src={BlackLogo} width={240} height={67} alt={"アマサーチ"} />
          </Box>
        </Fade>
        で。
      </Typography>
    </Box>
    <Box display={"flex"} justifyContent={"center"} alignItems={"center"} flexDirection={"row"}>
      <Box>
        <Typography variant={"h6"} fontWeight={"bold"}>
          今すぐアプリをダウンロード
        </Typography>
        <AppDownloadBadge />
      </Box>
      <Box
        position={"absolute"}
        right={{ sm: "calc(50% - 350px)", md: "calc(50% - 400px)" }}
        display={{ xs: "none", sm: "block" }}
      >
        <Image src={PersonImg} width={140} height={140} alt={""} />
      </Box>
    </Box>
  </Box>
);

const CatchPhrase = () => {
  const theme = createTheme();
  const [ref, inView] = useInView({ rootMargin: "-100px", triggerOnce: true });

  theme.typography.h4 = {
    ...theme.typography.h4,
    [theme.breakpoints.down("sm")]: {
      fontSize: "1.9rem",
    },
  };
  return (
    <ThemeProvider theme={theme}>
      <Container reference={ref} inView={inView} />
    </ThemeProvider>
  );
};

export default CatchPhrase;
