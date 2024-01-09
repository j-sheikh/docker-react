#Builder Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Runner Phase, uses Snapshot from builder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

