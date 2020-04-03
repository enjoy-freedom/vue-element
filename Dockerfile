FROM node:10.16.3-alpine
LABEL maintainer="wangjun_csd@si-tech.com.cn"

RUN mkdir /vnfm_ui
WORKDIR /vnfm_ui
COPY . /vnfm_ui
RUN apk update && apk add --no-cache nginx=1.14.2-r4  git

COPY nginx-app.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx
RUN npm install

EXPOSE 80

