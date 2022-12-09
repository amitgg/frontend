FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json   .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
#very tricky not required for local deployment only for elastic enviroments
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

