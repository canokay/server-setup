# Server Setup

Easy update, upgrade, Git, Make, and Docker install script for Debian-based systems.

## Features

- System update and upgrade
- Git and Make installation
- Docker and Docker Compose plugin installation
- Docker service setup and enable
- Global Git username and email configuration

## Quick Start

### 1. Download the setup script

```bash
curl -O https://raw.githubusercontent.com/canokay/server-setup/main/setup.sh
```

### 2. Make the script executable

```bash
chmod +x setup.sh
```

### 3. Run the script

```bash
sudo ./setup.sh
```

You will be prompted to enter your Git username and email.

---

## GitHub SSH Authentication (Optional)

To securely connect to GitHub using SSH:

### 1. Generate an SSH key

```bash
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

Press Enter through the prompts to accept the default location and optionally add a passphrase.

### 2. Display your public key

```bash
cat ~/.ssh/id_rsa.pub
```

### 3. Copy and add the key to your GitHub account

- Go to: [https://github.com/settings/keys](https://github.com/settings/keys)
- Click **New SSH key**
- Paste your copied key
- Click **Add SSH key**

Now you can push and pull from GitHub using SSH without typing your username and password each time.

---

## Requirements

- Debian-based Linux system (e.g., Debian, Ubuntu)
- Internet connection
- Root or sudo access
