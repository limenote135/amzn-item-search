FROM node:lts-alpine

WORKDIR /app

COPY package*.json *.lock ./

RUN --mount=type=cache,target=/usr/local/share/.cache/yarn/v6 yarn install

COPY . .

EXPOSE 3000

CMD yarn dev