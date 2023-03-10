import { Box, Container, Fade, Grid, Typography } from "@mui/material";
import AppDownloadBadge from "@/components/lp/AppDownloadBadge";
import { Image } from "@/components/Image";
import React, { useEffect, useState } from "react";
import { useInView } from "react-intersection-observer";
import { parser } from "@/plugin/budoux";

import BlackLogo from "@/assets/lp/logo_b.png";
import AppScreen from "@/assets/lp/app_screen.png";
import N0984 from "@/assets/lp/n0984.png";
import Copy1Pc from "@/assets/lp/copy1_pc.svg";
import Copy2Pc from "@/assets/lp/copy2_pc.svg";
import Copy2Sp from "@/assets/lp/copy2_sp.svg";

type FadeIns = [boolean, boolean];

type Props = {
  fadeIns: FadeIns;
  reference: (node?: Element | null | undefined) => void;
  inView: boolean;
  descriptionRef: (node?: Element | null | undefined) => void;
  descriptionInView: boolean;
  copyRef: (node?: Element | null | undefined) => void;
  copyInView: boolean;
};

// Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?
// というエラーが出るので、 forwardRef を使う
const Copy1Container = React.forwardRef((_, ref) => (
  <>
    <Box display={{ xs: "none", md: "block" }} ref={ref}>
      <Copy1Pc width={100} height={700} />
    </Box>
    <Box display={{ xs: "block", md: "none" }} ref={ref}>
      <Copy1Pc width={75} height={400} />
    </Box>
  </>
));

const TitleContainer = ({
  fadeIns,
  reference,
  inView,
  descriptionRef,
  descriptionInView,
  copyRef,
  copyInView,
}: Props) => (
  <Box component={"section"}>
    <Container maxWidth={"lg"}>
      <Box ref={reference} display={{ xs: "none", md: "block" }} />
      <Grid container justifyContent={"center"} alignItems={"center"}>
        <Grid item xs={12} textAlign={"center"} display={{ xs: "block", md: "none" }} mt={2}>
          <Fade in={fadeIns[1]} timeout={2000}>
            <Box>
              <Image
                src={BlackLogo}
                width={{ xs: 300, sm: 400 }}
                height={{ xs: 83, sm: 111 }}
                alt={"アマサーチ"}
                loading={"eager"}
              />
            </Box>
          </Fade>
        </Grid>
        <Grid item xs={7} sm={6} md={4} textAlign={"center"}>
          <Image
            src={AppScreen}
            width={{ xs: "211", md: "370" }}
            height={{ xs: "400", md: "700" }}
            alt="アプリ画面"
            loading={"eager"}
          />
        </Grid>
        <Grid item xs={5} sm={6} md={2} textAlign={"center"}>
          <Fade in={fadeIns[0]} timeout={2000}>
            <Copy1Container />
          </Fade>
        </Grid>
        <Grid item xs={12} md={6} textAlign={"center"}>
          <Fade in={fadeIns[1]} timeout={2000}>
            <Box my={10} display={{ xs: "none", md: "block" }}>
              <Image src={BlackLogo} width={400} height={112} alt={"アマサーチ"} loading={"eager"} />
            </Box>
          </Fade>
          <Fade in={fadeIns[0]} timeout={2000}>
            <Typography
              my={2}
              fontSize={{
                xs: "1rem",
                md: "1.25rem",
              }}
              // variant={"h6"}
              fontWeight={"bold"}
              dangerouslySetInnerHTML={{
                __html: parser.translateHTMLString(
                  "直感的に使えるから、仕入れに集中できる<br/>多機能・高速せどりサーチアプリ"
                ),
              }}
            />
          </Fade>
          <Box bgcolor={"#fedd6b"} borderRadius={"15px"} display={"inline-block"} textAlign={"center"} p={1}>
            <Typography variant={"body1"} fontWeight={"bold"}>
              今すぐアプリをダウンロード
            </Typography>
            <AppDownloadBadge />
          </Box>
        </Grid>
        <Grid item xs={12} textAlign={"center"} display={{ xs: "none", md: "block" }} mb={10} mt={-5}>
          <Fade in={inView} timeout={1000}>
            <Typography variant={"h6"} pb={4} component={"div"}>
              ▼Scroll Down
            </Typography>
          </Fade>
        </Grid>
        <Grid item xs={12} md={6} pt={2}>
          <Image src={N0984} alt={""} />
        </Grid>
        <Grid item xs={12} md={6} sx={{ backgroundColor: "rgba(243, 241, 241, .6)" }}>
          <Box ref={descriptionRef} />
          <Fade in={descriptionInView} timeout={1000}>
            <Typography
              my={2}
              variant={"h4"}
              fontWeight={"bold"}
              dangerouslySetInnerHTML={{
                __html: parser.translateHTMLString("こだわったのは、<br/>使いやすさと機能性の両立。"),
              }}
            />
          </Fade>
          <Typography
            my={2}
            dangerouslySetInnerHTML={{
              __html: parser.translateHTMLString("せどりで大事なのは計画的な仕入れ。"),
            }}
          />
          <Typography
            my={2}
            dangerouslySetInnerHTML={{
              __html: parser.translateHTMLString(
                "しかし、多くの人は情報を集めるのに時間がかかりすぎたり、" +
                  "管理が行き届かないことで資金や労力、時間を余計に無駄にしています。"
              ),
            }}
          />
          <Typography
            my={2}
            dangerouslySetInnerHTML={{
              __html: parser.translateHTMLString(
                "アマサーチはそういった無駄を限りなく減らせるようにUI・機能がデザインされており" +
                  "「あなたが本当にすべきこと」に専念させてくれるアプリです。"
              ),
            }}
          />
          <Typography
            my={2}
            dangerouslySetInnerHTML={{
              __html: parser.translateHTMLString(
                "せどりはまるでカーレース。勝つのは、頭脳と技術を発揮できる人です。" +
                  "アマサーチを使ってあなたの本来の力を発揮してください。"
              ),
            }}
          />
        </Grid>
        <Grid item xs={12} ref={copyRef} textAlign={{ xs: "right", md: "center" }}>
          <Fade in={copyInView} timeout={2000}>
            <Box mt={4} mb={8} display={{ xs: "none", md: "block" }}>
              <Copy2Pc width={800} height={100} alt={"アマサーチは、はやい。つよい。使いやすい。"} />
            </Box>
          </Fade>
          <Fade in={copyInView} timeout={2000}>
            <Box display={{ xs: "block", md: "none" }}>
              <Copy2Sp width={400} height={300} alt={"アマサーチは、はやい。つよい。使いやすい。"} />
            </Box>
          </Fade>
        </Grid>
      </Grid>
    </Container>
  </Box>
);

const Title = () => {
  const [show, setShow] = useState<FadeIns>([false, false]);
  useEffect(() => {
    let index = 0;
    const val: FadeIns = [false, false];
    const timerId = setInterval(() => {
      val[index++] = true;
      setShow([...val]);
      if (index == val.length) {
        clearInterval(timerId);
      }
    }, 1500);
    return () => {
      clearInterval(timerId);
    };
  }, []);

  const [skip, setSkip] = useState(true);
  useEffect(() => {
    setTimeout(() => {
      // 初回ロード中に Description がファーストビューに入ってしまうようなので、最初は無効化
      setSkip(false);
    }, 1500);
  }, []);

  const [ref, inView] = useInView({ rootMargin: "0px", trackVisibility: true, delay: 100 });
  const [descRef, descInView] = useInView({ rootMargin: "-100px", triggerOnce: true, skip: skip });
  const [copyRef, copyInView] = useInView({ rootMargin: "-100px", triggerOnce: true });

  return (
    <TitleContainer
      fadeIns={show}
      reference={ref}
      inView={inView}
      descriptionRef={descRef}
      descriptionInView={descInView}
      copyRef={copyRef}
      copyInView={copyInView}
    />
  );
};

export default Title;
