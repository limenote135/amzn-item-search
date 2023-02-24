import { getFunctions, httpsCallable } from "@firebase/functions";
import { app } from "@/plugin/firebase";

const func = getFunctions(app, "asia-northeast1");

export async function SendSupport(mail: string, content: string, env: string, ua: string) {
  const f = httpsCallable(func, "send-support");
  await f({ from: "Web", mail, content, device: ua, env });
}

export async function DisableUser() {
  const f = httpsCallable(func, "disable-user");
  await f();
}
