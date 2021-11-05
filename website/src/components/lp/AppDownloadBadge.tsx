import { Box } from "@mui/material";
import { Image } from "@/components/Image";
import React from "react";

type Props = {
  direction?: "column" | "row";
  scale?: number;
};

const AppDownloadBadge = ({ direction = "row", scale = 1 }: Props) => (
  <Box alignItems={"center"} justifyContent={"center"} display={"flex"} flexDirection={direction}>
    <Image
      src={"/img/apple_store_badge.svg"}
      width={179 * scale}
      height={53 * scale}
      alt={"iTunesStoreからダウンロード"}
    />

    <Image
      src={"/img/android_store_badge.png"}
      width={200 * scale}
      height={77 * scale}
      alt={"GooglePlayからダウンロード"}
    />
  </Box>
);

export default AppDownloadBadge;
