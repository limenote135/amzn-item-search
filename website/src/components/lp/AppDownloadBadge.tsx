import { Box, Typography } from "@mui/material";
import { Image } from "@/components/Image";
import React from "react";
import Link from "@/components/Link";

type Props = {
  direction?: "column" | "row";
  scale?: number;
};

const AppDownloadBadge = ({ direction = "row", scale = 1 }: Props) => (
  <>
    <Box alignItems={"center"} justifyContent={"center"} display={"flex"} flexDirection={direction}>
      <Link href={"https://apps.apple.com/jp/app/id1608782445"} target="_blank" rel="noopener noreferrer">
        <Image
          src={"/img/apple_store_badge.svg"}
          width={179 * scale}
          height={53 * scale}
          alt={"iTunesStoreからダウンロード"}
        />
      </Link>

      <Link
        href={"https://play.google.com/store/apps/details?id=com.knzc.app.amasearch"}
        target="_blank"
        rel="noopener noreferrer"
      >
        <Image
          src={"/img/android_store_badge.png"}
          width={200 * scale}
          height={77 * scale}
          alt={"GooglePlayからダウンロード"}
        />
      </Link>
    </Box>
    <Typography component={"p"} variant={"caption"} mt={-2}>
      ※ 利用にはAmazon大口セラー契約が必要です
    </Typography>
  </>
);

export default AppDownloadBadge;
