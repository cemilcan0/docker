FROM nginx:latest

USER root

# Apt-get kilit sorununu temizleme ve sudo yetkisi ekleme
RUN rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get update && apt-get install -y curl sudo python3 python3-pip

# Kullanıcı için sudo yetkisini tanımla (isteğe bağlı)
RUN echo "root ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root

# Çalışma dizinini ayarla
WORKDIR /usr/share/nginx/html

# Statik dosyaları kopyala
COPY index.html .
COPY styles.css .
COPY app.js .

# Sağlık kontrolü (healthcheck)
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost || exit 1

# Portu aç
EXPOSE 80
