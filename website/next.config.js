/** @type {import('next').NextConfig} */
module.exports = {
  webpack(config) {
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
};
