import {
  getAuth,
  GoogleAuthProvider,
  OAuthProvider,
  onAuthStateChanged,
  sendPasswordResetEmail,
  signInWithEmailAndPassword,
  signInWithPopup,
  signOut,
  User,
} from "@firebase/auth";
import { app } from "@/plugin/firebase";
import { atom, useRecoilCallback, useRecoilValue } from "recoil";
import { PlanNames } from "@/util/plan";
import * as Sentry from "@sentry/nextjs";

const auth = getAuth(app);

type UserData = {
  raw: User;
  mail: string;
  verified: boolean;
  claims: Claims;
};

type Claims = {
  uid: string;
  lwa: boolean;
  plan: PlanNames;
  trial: number;
};

type UserState = UserData | null;

export const userState = atom<UserState>({
  key: "auth/user",
  default: null,
  dangerouslyAllowMutability: true,
  effects: [
    ({ setSelf, trigger }) => {
      // a: 最初の認証状態を取得した時に解決するPromiseを初期値に設定
      let resolvePromise: (value: UserState) => void;
      const initValue = new Promise<UserState>(resolve => {
        resolvePromise = resolve;
      });
      // 最初の認証状態を得るまではReact.Suspenseにレンダリングをまかせるため初期値は promise にする
      setSelf(initValue);

      // b: 認証状態の監視
      const unsubscribe = onAuthStateChanged(auth, async user => {
        if (user) {
          Sentry.configureScope(scope => {
            scope.setUser({ id: user.uid });
          });
          const token = await user.getIdTokenResult();
          const lwa = token.claims.lwa as unknown as boolean;
          const plan = token.claims.pl as unknown as PlanNames;
          const trial = token.claims.td as unknown as number;
          const verified = user.emailVerified;
          const data: UserState = {
            raw: user,
            verified,
            mail: user.email!,
            claims: { lwa, plan, uid: user.uid, trial },
          };
          resolvePromise(data);
          setSelf(data);
        } else {
          resolvePromise(null);
          setSelf(null);
        }
      });

      // d: 監視を終了する関数を返す
      return () => {
        unsubscribe();
      };
    },
  ],
});

export const loginWithGoogle = async () => {
  const provider = new GoogleAuthProvider();
  return signInWithPopup(auth, provider);
};

export const loginWithApple = async () => {
  const provider = new OAuthProvider("apple.com");
  provider.addScope("email");
  provider.addScope("name");
  provider.setCustomParameters({
    locale: "ja_JP",
  });
  return signInWithPopup(auth, provider);
};

export const loginWithEmail = async (email: string, password: string) => {
  return signInWithEmailAndPassword(auth, email, password);
};

export const logout = async () => {
  return signOut(auth);
};

export const resetPassword = async (email: string) => {
  await sendPasswordResetEmail(auth, email);
};

export const useUser = () => {
  return useRecoilValue(userState);
};

export const useRefreshUser = () => {
  const user = useUser();
  return useRecoilCallback(
    ({ set }) =>
      async () => {
        const token = await user!.raw.getIdTokenResult(true);
        const lwa = token.claims.lwa as unknown as boolean;
        const plan = token.claims.pl as unknown as PlanNames;
        const trial = token.claims.td as unknown as number;

        const val: UserState = {
          raw: user!.raw,
          verified: user!.verified,
          mail: user!.mail,
          claims: { lwa, plan, uid: user!.claims.uid, trial },
        };
        set(userState, val);
      },
    [user]
  );
};
