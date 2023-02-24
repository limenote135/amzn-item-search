import { AppBar, IconButton, Toolbar } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import { useSetRecoilState } from "recoil";
import { IsMobileDrawerOpen } from "@/components/core/Drawer";
import { Image } from "@/components/Image";
import BlackLogo from "@/assets/lp/logo_b.png";
import React from "react";
import Link from "@/components/Link";

export const MyAppBar = () => {
  const setMobileOpen = useSetRecoilState(IsMobileDrawerOpen);

  const handleMobileDrawerToggle = () => {
    setMobileOpen(e => !e);
  };

  return (
    <AppBar position={"fixed"} sx={{ zIndex: theme => theme.zIndex.drawer + 1 }}>
      <Toolbar>
        <IconButton
          color="inherit"
          onClick={handleMobileDrawerToggle}
          edge="start"
          sx={{ mr: 2, display: { sm: "none" } }}
        >
          <MenuIcon />
        </IconButton>
        <Link href={"/mypage"}>
          <Image src={BlackLogo} width={(483 * 44) / 135} height={44} alt={"アプリロゴ"} loading={"eager"} />
        </Link>
      </Toolbar>
    </AppBar>
  );
};
