# Build stage
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Production nginx package
FROM nginx:1.18
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]