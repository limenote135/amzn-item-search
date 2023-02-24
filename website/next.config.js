// This file sets a custom webpack configuration to use your Next.js app
// with Sentry.
// https://nextjs.org/docs/api-reference/next.config.js/introduction
// https://docs.sentry.io/platforms/javascript/guides/nextjs/manual-setup/
const { withSentryConfig } = require("@sentry/nextjs");

/** @type {import('next').NextConfig} */
module.exports = {
  webpack(config) {
    config.module.rules.push({
      test: /\.svg$/,
      use: ["@svgr/webpack"],
    });
    return {
      ...config,
      watchOptions: {
        aggregateTimeout: 300,
        poll: 800,
        ignored: ["node_modules", ".next"],
      },
    };
  },
  reactStrictMode: true,
  images: {
    domains: ["play.google.com", "tools.applemediaservices.com"],
    loader: "custom",
  },
  trailingSlash: true,
  // basePath: "/lp2",
};

module.exports = withSentryConfig(
  module.exports,
  {
    // ソースマップのアップロードログなどを表示するため silent は false にする
    silent: true,
  },
  { hideSourceMaps: true }
);
