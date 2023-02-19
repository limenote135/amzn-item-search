import { AppBar, IconButton, Toolbar, Typography } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import { useSetRecoilState } from "recoil";
import { IsMobileDrawerOpen } from "@/components/core/Drawer";

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
        <Typography variant={"h6"} component={"div"} sx={{ flexGrow: 1 }}>
          マイページ
        </Typography>
      </Toolbar>
    </AppBar>
  );
};
