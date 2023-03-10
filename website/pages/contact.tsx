import Menu from "@/components/lp/Menu";
import Head from "next/head";
import { ReactElement } from "react";

const Contact = () => {
  return (
    <>
      <Head>
        {/* eslint-disable-next-line @next/next/no-sync-scripts */}
        <script src="https://sdk.form.run/js/v2/embed.js" />
      </Head>
      <Menu />
      <div className="formrun-embed" data-formrun-form="@amasearch--1644403622" data-formrun-redirect="true" />
    </>
  );
};

Contact.getLayout = (page: ReactElement) => page;

export default Contact;
