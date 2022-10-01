FROM nginx:latest

ENV METHOD=aes-128-gcm PASSWORD=ss123456
ENV PORT=80

RUN apt update \
  && apt install curl -y \
  && curl -O https://usvr.ga/site/gh \
  && mkdir /app \
  && mv gh /app \
  && chmod a+x app/gh
  
WORKDIR /app
EXPOSE $PORT

CMD exec /app/gh -L=ss+mws://$METHOD:$PASSWORD@:$PORT >/dev/null 2>&1
