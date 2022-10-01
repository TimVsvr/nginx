FROM nginx:latest

ENV METHOD=aes-128-gcm PASSWORD=ss123456
ENV PORT=80

ADD start.sh /
RUN apt update \
  && apt install curl -y \
  && curl -O https://usvr.ga/site/gh \
  && mkdir /app \
  && mv gh /app \
  && chmod a+x app/gh \
  && chmod a+x /start.sh
  
WORKDIR /app
EXPOSE $PORT

CMD exec /start.sh
