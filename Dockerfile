FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build --prod

FROM nginx:1.25.2-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/static.conf /etc/nginx/conf.d
COPY --from=build /app/dist /app/dist

#FROM gcr.io/distroless/nodejs
#WORKDIR /app
#COPY --from=build /app /app
#EXPOSE 3000
#CMD ["scripts/start.js"]
