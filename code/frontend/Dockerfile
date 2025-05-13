# Stage 1: Build React app
FROM public.ecr.aws/docker/library/node:18.14.2-alpine3.17 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Serve with NGINX
FROM public.ecr.aws/docker/library/nginx:stable-alpine

# Copy built assets
COPY --from=builder /app/build /usr/share/nginx/html

# Copy config.js into the root directory of nginx
COPY ./public/config.js /usr/share/nginx/html/config.js

# Runtime ENV injection support
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

