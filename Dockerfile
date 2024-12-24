FROM nginx:latest

USER root

# Apt-get kilit sorununu temizle ve apt-get'i güncelle
RUN rm -f /var/lib/apt/lists/lock \
    && rm -f /var/cache/apt/archives/lock \
    && rm -f /var/lib/dpkg/lock* \
    && rm -f /var/lib/dpkg/lock \
    && dpkg --configure -a \
    && apt-get clean \
    && apt-get update --allow-unauthenticated \
    && apt-get install -y curl sudo python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /usr/share/nginx/html

COPY index.html .
COPY styles.css .
COPY app.js .

# Sağlık kontrolü (healthcheck)
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost || exit 1

# Portu aç
EXPOSE 80
