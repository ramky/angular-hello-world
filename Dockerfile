FROM node:14.8.0 as build

### STAGE 1: Build ###
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . ./
RUN ./node_modules/@angular/cli/bin/ng build --prod

### STAGE 2: Run ###
FROM nginx:alpine
COPY --from=build /usr/src/app/dist/angular-hello-world /usr/share/nginx/html
