import { useRouter } from "next/router";
import { useEffect } from "react";
import { useUser } from "@/plugin/auth";

type Props = {
  children: JSX.Element;
};

const Auth = ({ children }: Props) => {
  const user = useUser();
  const router = useRouter();
  useEffect(() => {
    if (!user && router.route !== "/login") {
      router.replace(`/login?ref=${router.pathname}`);
    }
  }, [user, router]);

  if (!user && router.route !== "/login") {
    return <div>loading...</div>;
  }
  if (router.route === "/login" || user) {
    return children;
  }
  return <div>Invalid user</div>;
};

export default Auth;
