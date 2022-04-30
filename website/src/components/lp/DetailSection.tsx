import { Box, Collapse, Fade, Grid, Typography } from "@mui/material";
import React from "react";
import { useInView } from "react-intersection-observer";
import { parser } from "@/plugin/budoux";
import { Image } from "@/components/Image";
import { StaticImageData } from "next/image";

import Detail01 from "@/assets/lp/detail01.png";
import Detail02 from "@/assets/lp/detail02.png";
import Detail03 from "@/assets/lp/detail03.png";
import Detail04 from "@/assets/lp/detail04.png";
import Detail05 from "@/assets/lp/detail05.png";
import Detail06 from "@/assets/lp/detail06.png";

import Dec3 from "@/assets/lp/dec3_pc.svg";

type DetailItemProp = {
  fontColor: string;
  title: string;
  text: string;
  image: StaticImageData;
};

const DualLineDetailItem = ({ fontColor, title, text, image }: DetailItemProp) => (
  <Box display={"flex"} textAlign={"center"} flexDirection={"column"} pt={10}>
    <Box display={"flex"} flexDirection={"row"} alignItems={"center"} justifyContent={"center"}>
      <Dec3 width={60} height={60} alt={""} />
      <Typography
        variant={"h6"}
        fontWeight={"bold"}
        color={fontColor}
        dangerouslySetInnerHTML={{ __html: parser.translateHTMLString(title) }}
      />
    </Box>
    <Grid container alignItems={"center"} flexDirection={"row"}>
      <Grid item xs={12} md={6} textAlign={{ xs: "center", md: "right" }} p={2}>
        <Image src={image} width={300} height={567} alt={""} />
      </Grid>
      <Grid item xs={12} md={6} p={2} textAlign={"center"}>
        <Typography
          color={fontColor}
          lineHeight={2}
          textAlign={{ xs: "left" }}
          width={{ xs: 300, sm: 350, md: 500 }}
          mx={{ xs: "auto", md: 0 }}
          dangerouslySetInnerHTML={{ __html: parser.translateHTMLString(text) }}
        />
      </Grid>
    </Grid>
  </Box>
);

type DetailProp = {
  reference: (node?: Element | null | undefined) => void;
  inView: boolean;
};

const DetailContainer = ({ reference, inView }: DetailProp) => (
  <Box
    component={"section"}
    sx={{
      background: {
        xs: "url(img/dec2_sp.svg) no-repeat, linear-gradient( #33313A, #FEFEFE )",
        md: "url(img/dec2_pc.svg) no-repeat, linear-gradient( #33313A, #FEFEFE )",
      },
      backgroundPosition: "left top",
      backgroundRepeat: "no-repeat",
    }}
  >
    <Box ref={reference} pt={4}>
      <Collapse orientation={"horizontal"} in={inView} timeout={1500}>
        <Typography
          color={"#4b6e87"}
          fontSize={{
            xs: "3rem",
            sm: "6rem",
          }}
          sx={{ textTransform: "uppercase", textDecoration: "underline" }}
        >
          Detail　
        </Typography>
      </Collapse>
      <Fade in={inView} timeout={1000}>
        <Typography color={"#52a1c3"} fontWeight={"bold"} variant={"h6"}>
          amzn-item-searchを詳しく知る
        </Typography>
      </Fade>
      <DualLineDetailItem
        fontColor={"common.white"}
        title={"ひと目でわかる。充実した情報表示"}
        text={
          "必要な情報をひと目でカンタンに確認できるので、<br/>" +
          "<b>仕入れ作業の効率が高まります。</b><br/>" +
          "<b>目にもバッテリーにも優しい</b>ダークモードにも対応。"
        }
        image={Detail01}
      />
    </Box>
    <Box display={"flex"} textAlign={"center"} flexDirection={"column"} pt={10}>
      <DualLineDetailItem
        fontColor={"common.white"}
        title={"インストアコード対応で仕入れ効率UP"}
        text={
          "JANコードだけでなく、<b>BOOKOFF、GEO、TSUTAYAのインストアコードに対応。</b><br/>" +
          "これらの店舗でもスムーズな仕入れを実現します。"
        }
        image={Detail02}
      />
    </Box>
    <Box display={"flex"} textAlign={"center"} flexDirection={"column"} pt={10}>
      <DualLineDetailItem
        fontColor={"common.white"}
        title={"時間と労力を無駄にしない、<br/>出品可否確認機能。"}
        text={
          "「仕入れたのに出品できない！」と、<br/>あなたの貴重な時間と労力を無駄にしてしまっていませんか。<br/>" +
          "amzn-item-searchなら出品可否が一目でわかるから、<b>そんなことは起こりません。</b>"
        }
        image={Detail03}
      />
    </Box>
    <Box display={"flex"} textAlign={"center"} flexDirection={"column"} pt={10}>
      <DualLineDetailItem
        fontColor={""}
        title={"多彩なアラート機能で、<br/>利益商品を見逃さない"}
        text={
          "リサーチで重要なのは大量の商品からいかに素早く利益商品を見つけ出すか。<br/>" +
          "amzn-item-searchは多彩で便利なアラームを搭載。<br/>" +
          "利益商品を見逃しません。"
        }
        image={Detail04}
      />
    </Box>
    <Box display={"flex"} textAlign={"center"} flexDirection={"column"} pt={10}>
      <DualLineDetailItem
        fontColor={""}
        title={"スムーズな操作性をもたらす、<br/>ショートカット機能"}
        text={
          "画面左右をスワイプすることで<br/>" +
          "<b>よく使う機能をすぐに呼び出す</b>ことができ、<br/>" +
          "<b>スムーズ・直観的</b>な操作が可能です。"
        }
        image={Detail05}
      />
    </Box>
    <Box display={"flex"} textAlign={"center"} flexDirection={"column"} py={10}>
      <DualLineDetailItem
        fontColor={""}
        title={"日ごとの購入管理機能。<br/>データから閃きを得ることも。"}
        text={
          "購入した商品は日ごとに管理。<br/>" +
          "仕入れ済みの商品や利益率が<b>ひと目でわかります。</b><br/>" +
          "蓄積されるデータを読み取ることで、<br/>" +
          "<b>今後の仕入れを改善するための指標</b>にも。"
        }
        image={Detail06}
      />
    </Box>
  </Box>
);

const Detail = () => {
  const [ref, inView] = useInView({ rootMargin: "-100px", triggerOnce: true });

  return <DetailContainer reference={ref} inView={inView} />;
};

export default Detail;
