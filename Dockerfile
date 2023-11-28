FROM node:17-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i --production
RUN npm i vite
COPY . .
RUN npm run build
FROM node:17-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
EXPOSE 3010
CMD ["npm", "run","preview"]
