import axios from "axios";
import { loadStripe } from "@stripe/stripe-js";
import { ServerError } from "@/api/error";

export const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_KEY!);

const client = axios.create({
  baseURL: process.env.NEXT_PUBLIC_PAYMENT_SERVER_BASE,
});

client.interceptors.response.use(undefined, error => {
  if (axios.isAxiosError(error) && error.response) {
    const err = new ServerError(error.response.data, error.response.status);
    err.cause = error;
    return Promise.reject(err);
  }
  return Promise.reject(error);
});

export type NextPayment = {
  date: number;
  cancelAt: number;
  brand: string;
  number: string;
};

export async function GetNextPayment(token: string) {
  const resp = await client.get<NextPayment>(`/payment/next_payment`, {
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
  });
  return resp.data;
}

export type CreateSubscriptionRequest = {
  Plan: string;
  PaymentMethod: string;
};

export async function CreateSubscription(token: string, req: CreateSubscriptionRequest) {
  await client.post<string>(`/stripe/create_subscription`, req, {
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
  });
}

export async function CancelSubscription(token: string) {
  await client.post<void>(`/stripe/cancel_subscription`, null, {
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
  });
}

export async function CreateCard(token: string) {
  const resp = await client.post<string>(`/stripe/create_card`, null, {
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
  });
  return resp.data;
}

type UpdateCardRequest = {
  PaymentMethod: string;
};

export async function UpdateCard(token: string, paymentMethod: string) {
  const req: UpdateCardRequest = {
    PaymentMethod: paymentMethod,
  };
  await client.post<void>(`/stripe/update_card`, req, {
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
  });
}
