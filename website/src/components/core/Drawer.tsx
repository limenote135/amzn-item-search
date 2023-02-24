import { Box, Divider, Drawer, List, ListItemButton, ListItemText, Toolbar } from "@mui/material";
import { logout } from "@/plugin/auth";
import { atom, useRecoilState } from "recoil";
import Link from "@/components/Link";

export const IsMobileDrawerOpen = atom<boolean>({
  key: "is-mobile-drawer-open",
  default: false,
});

const drawerWidth = 200;
export const MyDrawer = () => {
  const [mobileOpen, setMobileOpen] = useRecoilState(IsMobileDrawerOpen);

  const handleDrawerToggle = () => {
    setMobileOpen(e => !e);
  };

  return (
    <>
      <Drawer
        variant="temporary"
        open={mobileOpen}
        onClose={handleDrawerToggle}
        ModalProps={{
          keepMounted: true, // Better open performance on mobile.
        }}
        sx={{
          display: { xs: "block", sm: "none" },
          "& .MuiDrawer-paper": { boxSizing: "border-box", width: drawerWidth },
        }}
      >
        <Box onClick={handleDrawerToggle}>
          <DrawerContent />
        </Box>
      </Drawer>
      <Drawer
        variant="permanent"
        sx={{
          display: { xs: "none", sm: "block" },
          width: drawerWidth,
          flexShrink: 0,
          [`& .MuiDrawer-paper`]: { width: drawerWidth, boxSizing: "border-box" },
        }}
      >
        <DrawerContent />
      </Drawer>
    </>
  );
};

const DrawerContent = () => {
  const handleLogout = () => {
    // TODO: ログアウト時に mobileDrawerOpen を false にする？
    logout();
  };

  return (
    <>
      <Toolbar />
      <List>
        <Link href={"/mypage/"}>
          <ListItemButton>
            <ListItemText primary="お知らせ" />
          </ListItemButton>
        </Link>
        <Link href={"/mypage/user/"}>
          <ListItemButton>
            <ListItemText primary="登録情報確認" />
          </ListItemButton>
        </Link>
        <Link href={"/mypage/plan/"}>
          <ListItemButton>
            <ListItemText primary="プラン変更" />
          </ListItemButton>
        </Link>
        <Divider />
        <Link href={"/mypage/support/"}>
          <ListItemButton>
            <ListItemText primary="サポート" />
          </ListItemButton>
        </Link>
        <ListItemButton>
          <ListItemText primary="ログアウト" onClick={handleLogout} />
        </ListItemButton>
      </List>
    </>
  );
};
