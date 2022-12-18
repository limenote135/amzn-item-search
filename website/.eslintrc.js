module.exports = {
  extends: ["next/core-web-vitals", "prettier"],
  plugins: ["unused-imports"],
  rules: {
    "no-console": process.env.NODE_ENV === "production" ? "warn" : "off",
    "no-debugger": process.env.NODE_ENV === "production" ? "warn" : "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "@typescript-eslint/no-empty-function": "off",
    "@typescript-eslint/no-unused-vars": "off",
    "react/display-name": "off",
    "unused-imports/no-unused-imports": "error",
  },
};
