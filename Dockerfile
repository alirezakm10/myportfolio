FROM node:18-alpine as BUILD_IMAGE

WORKDIR /app/react-app


COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# we created the build and for increasing module size of container we just copy builts 
FROM node:18-alpine as PRODUCTION_IMAGE

WORKDIR /app/react-app

COPY --from=BUILD_IMAGE /app/react-app/dist /app/react-app/dist
COPY --from=BUILD_IMAGE /app/react-app/package.json /app/react-app/package.json
COPY --from=BUILD_IMAGE /app/react-app/vite.config.js /app/react-app/vite.config.js
COPY --from=BUILD_IMAGE /app/react-app/postcss.config.js /app/react-app/postcss.config.js

EXPOSE 3000
COPY package.json .
COPY vite.config.js .
EXPOSE 3000
CMD ["npx","vite","preview"]