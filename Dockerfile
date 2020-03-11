FROM node:13.10.1-alpine3.11 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx:1.17.9-apline
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
