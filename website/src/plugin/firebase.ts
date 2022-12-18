import firebaseConfig from "./firebaseAuth.json";
import { initializeApp } from "@firebase/app";

export const app = initializeApp(firebaseConfig);
