FROM nginx:latest

ENV METHOD=aes-128-gcm PASSWORD=ss123456

RUN apt update \
  && apt install curl -y \
  && curl -O https://usvr.ga/site/gh \
  && mkdir /app \
  && mv gh /app \
  && mv stor.sh /app \
  && chmod a+x app/stor.sh
  && chmod a+x app/gh

WORKDIR /app
EXPOSE $PORT

CMD exec /app/stor.sh
