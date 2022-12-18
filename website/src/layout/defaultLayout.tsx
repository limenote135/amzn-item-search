import { ReactElement, Suspense } from "react";
import { RecoilRoot } from "recoil";

// SSR 有効だと Suspense が動かないので、SSR オフで読み込む
import dynamic from "next/dynamic";
const Auth = dynamic(() => import("@/components/auth"), {
  ssr: false,
});

export default function DefaultLayout(page: ReactElement) {
  return (
    <RecoilRoot>
      <Suspense fallback={<p>Loading...</p>}>
        <Auth>{page}</Auth>
      </Suspense>
    </RecoilRoot>
  );
}
