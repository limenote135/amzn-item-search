import { ReactElement } from "react";

export default function DefaultLayout(page: ReactElement) {
  return (
    <div id={"hogehoge"}>
      <a href={"http://www.google.co.jp"}>hogehoge</a>
      {page}
    </div>
  );
}
