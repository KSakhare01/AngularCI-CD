# stage 1
FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginix:alpine
COPY --from=build /app/dist/angular-app/ /user/share/nginix/html
# COPY --from=node /usr/src/app/dist/aston-villa-app /usr/share/nginx/html
