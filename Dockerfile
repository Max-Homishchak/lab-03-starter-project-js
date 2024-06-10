FROM node:14-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

FROM node:14-alpine

WORKDIR /app

COPY --from=build /app /app

CMD ["node", "index.js"]