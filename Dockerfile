FROM node:alpine as builder

WORKDIR /home/frontend

#COPY package.json .
#RUN npm install
COPY . .

RUN npm run build

# Runner phase
FROM nginx:alpine

COPY --from=builder /home/frontend/build /usr/share/nginx/html


