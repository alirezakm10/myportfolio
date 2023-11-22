FROM node:16-alpine as BUILD_IMAGE

WORKDIR /app/react-app


COPY package.json .
COPY vite.config.js .
RUN npm install
ENTRYPOINT ["/entrypoint.sh"]
COPY . .
RUN npm run build

EXPOSE 3000
CMD ["npm","run","preview"]