#!/bin/bash
set -e

# System update
apt update && apt upgrade -y

# Install required packages
echo "[+] Installing Git..."
apt install -y git

echo "[+] Installing Make..."
apt install -y make

echo "[+] Installing Docker..."
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

# Start and enable Docker service
systemctl enable --now docker

echo "[+] Docker and Docker Compose Plugin installed."

# Set Git username and email
read -p "Enter your Git username: " git_username
read -p "Enter your Git email address: " git_email
git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "[+] Git username and email configured."

echo "[✓] All operations completed successfully."
