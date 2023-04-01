import { ReactElement } from "react";
import Menu from "@/components/lp/Menu";

export default function LandingPageLayout(page: ReactElement) {
  return (
    <>
      <Menu />
      <main>{page}</main>
    </>
  );
}
