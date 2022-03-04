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
