#!/bin/bash
set -e

# Sistem güncellemesi
apt update && apt upgrade -y

# Gerekli paketlerin kurulumu
echo "[+] Git kuruluyor..."
apt install -y git

echo "[+] Make kuruluyor..."
apt install -y make

echo "[+] Docker kuruluyor..."
apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker servisini başlat ve enable et
systemctl enable --now docker

echo "[+] Docker ve Docker Compose Plugin kuruldu."

# Git kullanıcı adı ve email ayarlama
read -p "Git kullanıcı adınızı girin: " git_username
read -p "Git email adresinizi girin: " git_email
git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "[+] Git kullanıcı adı ve email ayarlandı."

echo "[✓] Tüm işlemler başarıyla tamamlandı." 
