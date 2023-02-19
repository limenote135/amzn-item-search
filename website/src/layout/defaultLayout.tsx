import { ReactElement, Suspense } from "react";
import { RecoilRoot } from "recoil";

// SSR 有効だと Suspense が動かないので、SSR オフで読み込む
import dynamic from "next/dynamic";
import { useRouter } from "next/router";
import { MyAppBar } from "@/components/core/AppBar";
import { MyDrawer } from "@/components/core/Drawer";
import { Box, Toolbar } from "@mui/material";
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
        {page}
      </Box>
    </Box>
  );
};

export default function DefaultLayout(page: ReactElement) {
  const router = useRouter();
  return (
    <RecoilRoot>
      <Suspense fallback={<p>Loading...</p>}>
        <Auth>{router.route === "/login" ? <>{page}</> : <CommonLayout page={page} />}</Auth>
      </Suspense>
    </RecoilRoot>
  );
}
