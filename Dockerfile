FROM node:17-alpine
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
COPY .env .
CMD ["npm","run","dev"]