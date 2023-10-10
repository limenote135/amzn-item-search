import { useInView } from "react-intersection-observer";
import { Box, Collapse, Fade, Grid, Typography } from "@mui/material";
import React, { ReactNode, useState } from "react";
import { parser } from "@/plugin/budoux";
import Link from "@/components/Link";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import KeyboardArrowUpIcon from "@mui/icons-material/KeyboardArrowUp";

type PriceBoxProps = {
  title: string;
  subtitle: string;
  price: number;
  detail: ReactNode;
};

const PriceBox = ({ title, subtitle, price, detail }: PriceBoxProps) => {
  return (
    <Grid item xs={12} sm={4}>
      <Box
        borderRadius={"15px 15px 0 0"}
        border={"solid 3px #ffbe2e"}
        textAlign={"center"}
        m={2}
        display={"flex"}
        flexDirection={"column"}
        height={"100%"}
      >
        <Box py={3} sx={{ backgroundColor: "#ffbe2e" }}>
          <Typography variant={"h6"} my={1} fontWeight={"bold"}>
            {title}
          </Typography>
          <Typography>{subtitle}</Typography>
        </Box>
        <Box py={3}>
          <Box my={3}>
            <Typography component={"span"} variant={"h3"} fontWeight={"bold"}>
              {price.toLocaleString()}
            </Typography>
            <Typography component={"span"} fontWeight={"bold"}>
              円/月
            </Typography>
          </Box>
          {detail}
        </Box>
      </Box>
    </Grid>
  );
};

type PriceProp = {
  reference: (node?: Element | null | undefined) => void;
  inView: boolean;
  isDetailOpen: boolean;
  onClickDetail: () => void;
};

const PriceContainer = ({ reference, inView, isDetailOpen, onClickDetail }: PriceProp) => {
  return (
    <Box component={"section"} pb={8}>
      <Box ref={reference} pt={4}>
        <Collapse orientation={"horizontal"} in={inView} timeout={1500}>
          <Typography
            color={"#4b6e87"}
            fontSize={{ xs: "3rem", sm: "6rem" }}
            sx={{ textTransform: "uppercase", textDecoration: "underline" }}
          >
            Price　
          </Typography>
        </Collapse>
        <Fade in={inView} timeout={1000}>
          <Typography color={"#52a1c3"} fontWeight={"bold"} variant={"h6"}>
            料金プラン
          </Typography>
        </Fade>
      </Box>
      <Box maxWidth={980} mx={"auto"} py={4}>
        <Grid container rowSpacing={4} justifyContent={"center"}>
          <PriceBox
            title={"フリープラン"}
            subtitle={"まずは無料でお試し"}
            price={0}
            detail={
              <Typography
                dangerouslySetInnerHTML={{
                  __html: parser.translateHTMLString("リサーチに必要な基本的な機能がご利用いただけます。"),
                }}
              />
            }
          />
          <PriceBox
            title={"標準プラン"}
            subtitle={"本格的にリサーチをしたい方へ"}
            price={2980}
            detail={
              <>
                <Typography
                  dangerouslySetInnerHTML={{
                    __html: parser.translateHTMLString("リサーチする上で便利なすべての機能がご利用いただけます。"),
                  }}
                />
                <Box
                  display={"flex"}
                  mt={2}
                  mb={1}
                  justifyContent={"center"}
                  alignItems={"end"}
                  onClick={onClickDetail}
                >
                  <Typography variant={"body2"}>利用可能になる機能の例</Typography>
                  {isDetailOpen ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
                </Box>
                <Collapse in={isDetailOpen} timeout="auto" unmountOnExit>
                  <Box>
                    <Typography variant={"body2"}>価格グラフ表示</Typography>
                    <Typography variant={"body2"}>インストアコード読み込み</Typography>
                    <Typography variant={"body2"}>バリエーション検索</Typography>
                    <Typography variant={"body2"}>音声読み上げ</Typography>
                    <Typography variant={"body2"}>キープリスト</Typography>
                    <Typography variant={"body2"}>出品可否表示</Typography>
                    <Typography variant={"body2"}>危険物表示</Typography>
                  </Box>
                </Collapse>
              </>
            }
          />
        </Grid>
      </Box>
      <Box mt={2} textAlign={"center"}>
        アプリ登録後1か月間は全ての機能がご利用いただけます。
      </Box>
      <Box mt={2} textAlign={"center"}>
        <Typography>
          プランの変更は
          <Link href={"/mypage"}>
            <Typography component={"span"} sx={{ textDecoration: "underline" }} color={"blue"}>
              マイページ
            </Typography>
          </Link>
          より行うことができます。
        </Typography>
      </Box>
    </Box>
  );
};

const Price = () => {
  const [ref, inView] = useInView({ rootMargin: "-100px", triggerOnce: true });
  const [isOpen, setIsOpen] = useState(false);

  const handleOpen = () => {
    setIsOpen(prev => !prev);
  };

  return <PriceContainer reference={ref} inView={inView} isDetailOpen={isOpen} onClickDetail={handleOpen} />;
};

export default Price;
