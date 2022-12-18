import {
  getAuth,
  GoogleAuthProvider,
  onAuthStateChanged,
  signInWithEmailAndPassword,
  signInWithPopup,
  signOut,
} from "@firebase/auth";
import { app } from "@/plugin/firebase";
import { atom, useRecoilValue } from "recoil";

const auth = getAuth(app);

type UserData = {
  uid: string;
  lwa: boolean;
};
type UserState = UserData | null;

const userState = atom<UserState>({
  key: "auth/user",
  default: null,
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
          const token = await user.getIdTokenResult();
          console.log("token", token);
          const lwa = token.claims.lwa as unknown as boolean;
          resolvePromise({ uid: user.uid, lwa });
          setSelf({ uid: user.uid, lwa });
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

export const loginWithEmail = async (email: string, password: string) => {
  return signInWithEmailAndPassword(auth, email, password);
};

export const logout = async () => {
  return signOut(auth);
};

export const useUser = () => {
  return useRecoilValue(userState);
};
