import { getAuth, GoogleAuthProvider, onAuthStateChanged, signInWithPopup, signOut } from "@firebase/auth";
import { app } from "@/plugin/firebase";
import { atom, useRecoilValue } from "recoil";

const auth = getAuth(app);

type UserData = {
  uid: string;
  isValid: boolean;
};
type UserState = UserData | null;

const userState = atom<UserData | null>({
  key: "auth/user",
  default: null,
  effects: [
    ({ setSelf, trigger }) => {
      // a: 最初の認証状態を取得した時に解決するPromiseを初期値に設定
      let resolvePromise: (value: UserData | null) => void;
      const initValue = new Promise<UserData | null>(resolve => {
        resolvePromise = resolve;
      });
      // 最初の認証状態を得るまではReact.Suspenseにレンダリングをまかせるため初期値は promise にする
      setSelf(initValue);

      // b: 認証状態の監視
      const unsubscribe = onAuthStateChanged(auth, async user => {
        if (user) {
          const token = await user.getIdTokenResult();
          const isValid = token.claims.isValid as unknown as boolean;
          resolvePromise({ uid: user.uid, isValid });
          setSelf({ uid: user.uid, isValid });
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

export const login = async () => {
  const provider = new GoogleAuthProvider();
  return signInWithPopup(auth, provider);
};

export const logout = async () => {
  return signOut(auth);
};

export const useUser = () => {
  return useRecoilValue(userState);
};
