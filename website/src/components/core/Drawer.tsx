import { Divider, Drawer, List, ListItemButton, ListItemText, Toolbar } from "@mui/material";
import { logout } from "@/plugin/auth";
import { atom, useRecoilState } from "recoil";

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
        <DrawerContent />
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
        <ListItemButton>
          <ListItemText primary="メニュー１" />
        </ListItemButton>
        <ListItemButton>
          <ListItemText primary="メニュー２" />
        </ListItemButton>
        <Divider />
        <ListItemButton>
          <ListItemText primary="ログアウト" onClick={handleLogout} />
        </ListItemButton>
      </List>
    </>
  );
};
