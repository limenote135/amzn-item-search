import { useRouter } from "next/router";
import { useEffect } from "react";
import { useUser } from "@/plugin/auth";
import { Loading } from "@/components/core/Loading";

type Props = {
  children: JSX.Element;
};

const Auth = ({ children }: Props) => {
  const user = useUser();
  const router = useRouter();
  useEffect(() => {
    if (!user && !router.route.startsWith("/login")) {
      router.replace(`/login?ref=${router.pathname}`);
    }
  }, [user, router]);

  if (!user && !router.route.startsWith("/login")) {
    return <Loading />;
  }
  if (router.route.startsWith("/login") || user) {
    return children;
  }
  return <div>Invalid user</div>;
};

export default Auth;
