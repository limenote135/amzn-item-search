export type PlanNames = "free" | "trial" | "standard" | "campaign";

export function getPlanName(name?: PlanNames) {
  switch (name) {
    case "free":
      return "フリープラン";
    case "trial":
      return "トライアル";
    case "standard":
      return "通常プラン";
    case "campaign":
      return "キャンペーンプラン";
  }
  return "不明";
}

export function isPaidUser(plan?: PlanNames) {
  if (!plan) {
    return false;
  }
  switch (plan) {
    case "free":
    case "trial":
      return false;
    case "standard":
    case "campaign":
      return true;
  }
  return true;
}
