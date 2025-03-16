# use an existing docker image as a base
FROM node:16-alpine as builder


# download and install a dependency
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# second phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
