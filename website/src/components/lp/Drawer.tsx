import {
  Box,
  Divider,
  Drawer,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Typography,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import { Image } from "@/components/Image";
import Link from "@/components/Link";
import AppDownloadBadge from "@/components/lp/AppDownloadBadge";
import React from "react";
import { styled } from "@mui/system";

import WhiteLogo from "@/assets/lp/logo_w.png";

export type DrawerProp = {
  isOpen: boolean;
  handleToggleDrawerOpen: () => void;
};

const CenteredListItemText = styled(ListItemText)({
  textAlign: "center",
});

const CenteredListItem = styled(ListItem)({
  textAlign: "center",
});

const MyDrawer = ({ isOpen, handleToggleDrawerOpen }: DrawerProp) => (
  <Drawer
    open={isOpen}
    onClose={handleToggleDrawerOpen}
    anchor={"right"}
    PaperProps={{ sx: { width: "66%", backgroundColor: "#737776" } }}
  >
    <List>
      <ListItem>
        <ListItemIcon>
          <CloseIcon onClick={handleToggleDrawerOpen} />
        </ListItemIcon>
      </ListItem>
      <Divider />
      <CenteredListItem>
        <Image src={WhiteLogo} width={229 /*(483 * 64) / 135*/} height={64} alt={"アプリロゴ"} />
      </CenteredListItem>
      <ListItemButton>
        <Link href={"/login"}>
          <CenteredListItemText>ログイン</CenteredListItemText>
        </Link>
      </ListItemButton>
      <ListItemButton>
        <Link href={"/terms/service"}>
          <CenteredListItemText>利用規約</CenteredListItemText>
        </Link>
      </ListItemButton>
      <ListItemButton>
        <Link href={"/terms/privacy"}>
          <CenteredListItemText>プライバシーポリシー</CenteredListItemText>
        </Link>
      </ListItemButton>
      <ListItemButton>
        <Link href={"/terms/law"}>
          <CenteredListItemText>特定商取引法に基づく表記</CenteredListItemText>
        </Link>
      </ListItemButton>
      <ListItemButton>
        <Link href={"/contact"}>
          <CenteredListItemText>お問い合わせ</CenteredListItemText>
        </Link>
      </ListItemButton>
      <CenteredListItem>
        <Box bgcolor={"white"} borderRadius={"15px"} mx={"auto"} px={1} mt={3} py={1}>
          <Typography variant={"body2"} color={"black"} my={2} fontWeight={"bold"}>
            今すぐアプリをダウンロード
          </Typography>
          <Typography color={"black"}>
            <AppDownloadBadge direction={"column"} scale={1} />
          </Typography>
        </Box>
      </CenteredListItem>
    </List>
  </Drawer>
);

export default MyDrawer;
