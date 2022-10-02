FROM nginx:latest

ENV METHOD=aes-128-gcm PASSWORD=ss123456
ENV PORT=80

ADD * /app/
RUN apt update \
  && apt install curl -y \
  && mv /app/default.conf /etc/nginx/conf.d \
  && chmod a+x app/gh /app/start.sh
  
WORKDIR /app
EXPOSE $PORT

CMD exec /app/start.sh
