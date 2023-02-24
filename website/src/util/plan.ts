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
