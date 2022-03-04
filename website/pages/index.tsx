import React from "react";
import { Box } from "@mui/material";
import Feature from "@/components/lp/FeatureSection";
import Menu from "@/components/lp/Menu";
import Detail from "@/components/lp/DetailSection";
import Footer from "@/components/lp/Footer";
import Title from "@/components/lp/Title";
import CatchPhrase from "@/components/lp/CatchPhrase";

const Component = () => (
  <>
    <Menu />
    <main>
      <Box
        sx={{
          backgroundRepeat: "no-repeat",
          background: {
            xs: "url(img/dec1_sp.svg) no-repeat, linear-gradient(#EDEBEA, #FEFEFE)",
            md: "url(img/dec1_pc.svg) no-repeat, linear-gradient(#EDEBEA, #FEFEFE)",
          },
          backgroundPosition: {
            xs: "left top",
            sm: "right top",
            md: "right top",
          },
        }}
      >
        <Title />
        <Feature />
      </Box>
      <Detail />
      <CatchPhrase />
    </main>
    <Footer />
  </>
);

const Container = () => {
  return <Component />;
};

export default Container;
