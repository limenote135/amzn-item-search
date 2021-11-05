import { AppBar, Box, Button, IconButton, ThemeProvider, Toolbar } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import React, { useState } from "react";
import { createTheme } from "@mui/material/styles";
import { Image } from "@/components/Image";
import Link from "@/components/Link";
import Drawer, { DrawerProp } from "@/components/lp/Drawer";

const returnToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

const TitleBarContainer = ({ isOpen, handleToggleDrawerOpen, returnToTop }: DrawerProp) => (
  <AppBar position={"sticky"} component={"header"}>
    <Toolbar>
      <Box sx={{ cursor: "pointer" }}>
        <Link href={"/"}>
          <Image src={"/img/logo_w.png"} width={(483 * 44) / 135} height={44} alt={"アプリロゴ"} />
        </Link>
      </Box>
      <Box flexGrow={1} />
      <Box display={{ xs: "none", sm: "block" }}>
        <Link href={"/terms/service"} color={"#FFF"}>
          <Button color={"inherit"}>利用規約</Button>
        </Link>
        <Link href={"/terms/privacy"} color={"#FFF"}>
          <Button color={"inherit"}>プライバシーポリシー</Button>
        </Link>
        <Button color={"inherit"}>お問い合わせ</Button>
      </Box>
      <IconButton sx={{ display: { sm: "none" } }} onClick={handleToggleDrawerOpen}>
        <MenuIcon />
      </IconButton>
    </Toolbar>
    <Drawer isOpen={isOpen} handleToggleDrawerOpen={handleToggleDrawerOpen} returnToTop={returnToTop} />
  </AppBar>
);

const Menu = () => {
  const [isOpen, setIsOpen] = useState(false);

  const toggleDrawerOpen = () => {
    setIsOpen(prevState => !prevState);
  };

  const theme = React.useMemo(
    () =>
      createTheme({
        palette: {
          mode: "dark",
        },
      }),
    []
  );

  return (
    <ThemeProvider theme={theme}>
      <TitleBarContainer isOpen={isOpen} handleToggleDrawerOpen={toggleDrawerOpen} returnToTop={returnToTop} />
    </ThemeProvider>
  );
};

export default Menu;
