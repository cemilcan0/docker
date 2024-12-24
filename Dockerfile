FROM nginx:latest

USER root

RUN apt-get update && apt-get install -y curl sudo python3 python3-pip

# Çalışma dizinini ayarla
WORKDIR /usr/share/nginx/html

COPY index.html .
COPY styles.css .
COPY app.js .

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost || exit 1

EXPOSE 80
