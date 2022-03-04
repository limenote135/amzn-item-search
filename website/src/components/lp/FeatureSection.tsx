import {
  Box,
  Collapse,
  Container,
  Fade,
  Grid,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Typography,
} from "@mui/material";
import CheckBoxIcon from "@mui/icons-material/CheckBox";
import { useInView } from "react-intersection-observer";
import React, { ReactNode } from "react";
import { parser } from "@/plugin/budoux";
import { Image } from "@/components/Image";

type FeatureItemProps = {
  title: string;
  content: string;
  icon: ReactNode;
};

const FeatureItem = ({ title, content, icon }: FeatureItemProps) => (
  <Box display={"flex"} flexDirection={"column"} width={"100%"}>
    <Box display={"flex"} flexDirection={"row"} alignItems={"center"} height={"64px"}>
      <Image src={"/img/dec4.svg"} width={10} height={20} alt={""} />
      <Typography variant={"h6"} textAlign={"center"} fontWeight={"bold"} ml={1}>
        {title}
      </Typography>
    </Box>
    <Typography
      variant={"body1"}
      my={1}
      flexGrow={1}
      dangerouslySetInnerHTML={{ __html: parser.translateHTMLString(content) }}
    />
    <Box textAlign={"center"}>{icon}</Box>
  </Box>
);

type FeatureListProps = {
  features: string[];
};

const FeatureList = ({ features }: FeatureListProps) => (
  <Box display={"flex"} flexDirection={"column"} alignItems={{ xs: "center", sm: "unset" }}>
    <Box display={"flex"} flexDirection={"row"} borderBottom={"2px solid #9cb199"} alignItems={"center"}>
      <Box display={"inline-block"} sx={{ margin: "2px" }}>
        <Image src={"/img/loupe.png"} width={30} height={30} alt={""} />
      </Box>
      <Typography variant={"h5"} fontFamily={"bold"}>
        アマサーチの主な機能
      </Typography>
    </Box>
    <List>
      {features.map((feature, i) => (
        <ListItem key={i}>
          <ListItemIcon>
            <CheckBoxIcon />
          </ListItemIcon>
          <ListItemText primary={feature} />
        </ListItem>
      ))}
    </List>
  </Box>
);

type FeatureProp = {
  reference: (node?: Element | null | undefined) => void;
  inView: boolean;
};

const FeatureContainer = ({ reference, inView }: FeatureProp) => (
  <Box component={"section"} ref={reference} py={4}>
    <Collapse orientation={"horizontal"} in={inView} timeout={1500}>
      <Typography
        color={"#99b69f"}
        fontSize={{
          xs: "3rem",
          sm: "6rem",
        }}
        sx={{ textTransform: "uppercase", textDecoration: "underline" }}
      >
        Feature　
      </Typography>
    </Collapse>
    <Fade in={inView} timeout={1000}>
      <Typography color={"#3e7647"} fontWeight={"bold"} variant={"h6"}>
        アマサーチの特徴
      </Typography>
    </Fade>
    <Container maxWidth={"md"}>
      <Grid container justifyContent={"center"} my={2}>
        <Grid item xs={12} md={6} display={"flex"} px={{ xs: 0, sm: 2 }} justifyContent={"content"}>
          <FeatureItem
            title={"直観的で使いやすいUI"}
            content={"説明なしで使いこなせるシンプルでわかりやすいユーザーインターフェース"}
            icon={<Image src={"/img/feature1.png"} width={300} height={300} alt={""} />}
          />
        </Grid>

        <Grid item xs={12} md={6} display={"flex"} px={{ xs: 0, sm: 2 }} justifyContent={"center"}>
          <FeatureItem
            title={"圧倒的な動作スピード"}
            content={"高速バーコードリーダーと軽快なアプリ動作でスピーディーな仕入れが可能に"}
            icon={<Image src={"/img/feature2.png"} width={300} height={300} alt={""} />}
          />
        </Grid>
        <Grid item xs={12} md={6} display={"flex"} px={{ xs: 0, sm: 2 }} justifyContent={"center"}>
          <FeatureItem
            title={"充実した機能"}
            content={"せどり仕入れに必要な機能を網羅した、オールインワンのシステム設計"}
            icon={<Image src={"/img/feature3.png"} width={300} height={300} alt={""} />}
          />
        </Grid>
        <Grid item xs={12} md={6} display={"flex"} px={{ xs: 0, sm: 2 }} justifyContent={"center"}>
          <FeatureList
            features={[
              "高速バーコードリーダー",
              "インストアコード対応",
              "Keepaグラフ表示",
              "ダークモード対応",
              "アラート機能",
            ]}
          />
        </Grid>
      </Grid>
    </Container>
  </Box>
);

const Feature = () => {
  const [ref, inView] = useInView({ rootMargin: "-100px", triggerOnce: true });
  return <FeatureContainer reference={ref} inView={inView} />;
};

export default Feature;
