import { ReactElement, Suspense } from "react";
import { RecoilRoot } from "recoil";
import { useRouter } from "next/router";
import { Box, Toolbar } from "@mui/material";
import { MyAppBar } from "@/components/core/AppBar";
import { MyDrawer } from "@/components/core/Drawer";
import { Loading } from "@/components/core/Loading";
import * as Sentry from "@sentry/react";

// SSR 有効だと Suspense が動かないので、SSR オフで読み込む
import dynamic from "next/dynamic";
const Auth = dynamic(() => import("@/components/auth"), {
  ssr: false,
});

const CommonLayout = ({ page }: { page: ReactElement }) => {
  return (
    <Box sx={{ display: "flex" }}>
      <header>
        <MyAppBar />
      </header>
      <nav>
        <MyDrawer />
      </nav>
      <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
        <Toolbar />
        <Sentry.ErrorBoundary fallback={<p>An error has occurred</p>}>{page}</Sentry.ErrorBoundary>
        {/*{page}*/}
      </Box>
    </Box>
  );
};

export default function DefaultLayout(page: ReactElement) {
  const router = useRouter();
  return (
    <RecoilRoot>
      <Suspense fallback={<Loading />}>
        <Auth>{router.route.startsWith("/login") ? <>{page}</> : <CommonLayout page={page} />}</Auth>
      </Suspense>
    </RecoilRoot>
  );
}
