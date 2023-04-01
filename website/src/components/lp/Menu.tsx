import { AppBar, Box, Button, IconButton, ThemeProvider, Toolbar } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import React, { useState } from "react";
import { createTheme } from "@mui/material/styles";
import { Image } from "@/components/Image";
import Link from "@/components/Link";
import Drawer, { DrawerProp } from "@/components/lp/Drawer";

import WhiteLogo from "@/assets/lp/logo_w.png";

const TitleBarContainer = ({ isOpen, handleToggleDrawerOpen }: DrawerProp) => (
  <AppBar position={"sticky"} component={"header"}>
    <Toolbar>
      <Box sx={{ cursor: "pointer" }}>
        <Link href={"/"}>
          <Image src={WhiteLogo} width={(483 * 44) / 135} height={44} alt={"アプリロゴ"} loading={"eager"} />
        </Link>
      </Box>
      <Box flexGrow={1} />
      <Box display={{ xs: "none", sm: "block" }}>
        <Button color={"inherit"} href={"/terms/service"}>
          利用規約
        </Button>
        <Button color={"inherit"} href={"/terms/privacy"}>
          プライバシーポリシー
        </Button>
        <Button color={"inherit"} href={"/contact"}>
          お問い合わせ
        </Button>
        <Button color={"inherit"} href={"/login"}>
          ログイン
        </Button>
      </Box>
      <IconButton sx={{ display: { sm: "none" } }} onClick={handleToggleDrawerOpen}>
        <MenuIcon />
      </IconButton>
    </Toolbar>
    <Drawer isOpen={isOpen} handleToggleDrawerOpen={handleToggleDrawerOpen} />
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
      <TitleBarContainer isOpen={isOpen} handleToggleDrawerOpen={toggleDrawerOpen} />
    </ThemeProvider>
  );
};

export default Menu;
