import { Box, Typography } from "@mui/material";
import { Image } from "@/components/Image";
import React from "react";
import Link from "@/components/Link";

import AndroidBadge from "@/assets/lp/android_store_badge.png";
import AppleBadge from "@/assets/lp/apple_store_badge.svg";

type Props = {
  direction?: "column" | "row";
  scale?: number;
};

const AppDownloadBadge = ({ direction = "row", scale = 1 }: Props) => (
  <>
    <Box alignItems={"center"} justifyContent={"center"} display={"flex"} flexDirection={direction}>
      <Link href={"https://apps.apple.com/jp/app/id1608782445"} target="_blank" rel="noopener noreferrer">
        {/* SVG 内に書かれたデフォルトサイズが width: 109, height: 90 なので、ViewBox で表示範囲を "0 0 109 40" にして
         コンポーネントの width, height で拡大する*/}
        <AppleBadge
          width={179 * scale}
          height={53 * scale}
          viewBox={`0 0 109 40`}
          alt={"iTunesStoreからダウンロード"}
        />
      </Link>

      <Link
        href={"https://play.google.com/store/apps/details?id=com.knzc.app.amasearch"}
        target="_blank"
        rel="noopener noreferrer"
      >
        <Image src={AndroidBadge} width={200 * scale} height={77 * scale} alt={"GooglePlayからダウンロード"} />
      </Link>
    </Box>
    <Typography component={"p"} variant={"caption"} mt={-2}>
      ※ 利用にはAmazon大口セラー契約が必要です
    </Typography>
  </>
);

export default AppDownloadBadge;
