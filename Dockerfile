# Base image for creating a build
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm build

# To serve frontend files in production, we are using nginx as base image with previous build
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html