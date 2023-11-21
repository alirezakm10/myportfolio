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
EXPOSE 3000
COPY package.json .
COPY vite.config.js .
EXPOSE 3000
CMD ["npm","run","preview"]