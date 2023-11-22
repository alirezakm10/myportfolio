FROM node:18-alpine as BUILD_IMAGE

WORKDIR /app/react-app


COPY package.json .
RUN npm install
RUN npm i -g vite
COPY . .
RUN npm run build

# we created the build and for increasing module size of container we just copy builts 
FROM node:18-alpine as PRODUCTION_IMAGE

WORKDIR /app/react-app
RUN addgroup --system --gid 1002 nodejs
RUN adduser --system --uid 1002 3dportfolio
COPY --from=BUILD_IMAGE /app/react-app/dist /app/react-app/dist
EXPOSE 3000
COPY package.json .
COPY vite.config.js .
USER 3dportfolio
EXPOSE 3000
CMD ["npx","vite","preview"]