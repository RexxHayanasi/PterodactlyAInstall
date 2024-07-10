#!/bin/bash

# Warna
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "                                                       "
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${BLUE}[+]            WELCOME TO AUTO INSTALLER            [+]${NC}"
echo -e "${BLUE}[+]               OPYRIGHT BY REXXZYNXD              [+]${NC}"
echo -e "${BLUE}[+]               inspiration For All              [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
echo -e "𝗔𝗧𝗧𝗘𝗡𝗧𝗜𝗢𝗡 :                                            "
echo -e "script ini di buat untuk mempermudah penginstalasian   "
echo -e "terkait pterodactyle, gunakan script sebaik baiknya.   "
echo -e "                                                       "
echo -e "𝗔𝗨𝗧𝗛𝗢𝗥 :                                              "
echo -e "REXXZYNXD                                               "
echo -e "𝗪𝗛𝗔𝗧𝗦𝗔𝗣𝗣 :                                            "
echo -e "0822 4993 0312                                         "
echo -e "𝗬𝗢𝗨𝗧𝗨𝗕𝗘 :                                             "
echo -e "@REXXZYNXD                                              "
echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :                                              "
echo -e "REXXZYNXD                                                 "
sleep 4
clear

echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]             UPDATE & INSTALL JQUERY             [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
sudo apt update
sudo apt install -y jq
echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]              INSTALL JQUERY BERHASIL            [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
sleep 1
clear
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                   SELECT OPTION                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
echo -e "SELECT OPTION :"
echo "1. Install panel"
echo "2. Install tema"
echo "3. Uninstall tema"
echo -e "Masukkan pilihan (1/2/3):"
read MENU_CHOICE
clear

# Fungsi untuk menginstal panel Pterodactyl
install_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                   INSTALL PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  if [ -d /var/www/pterodactyl ]; then
    echo -e "${GREEN}PANEL SUDAH DI INSTALL.${NC}"
  else    
    bash <(curl -s https://pterodactyl-installer.se)
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                INSTALL PANEL SUCCCESS           [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
  fi
}

# Fungsi untuk menginstal tema Pterodactyl
install_tema() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "PILIH THEMA YANG INGIN DI INSTALL"
  echo "1. stellar"
  echo "2. billing"
  echo "x. kembali"
  echo -e "masukan pilihan (1/2) :"
  read SELECT_THEME
  
  case "$SELECT_THEME" in
    1)
      # URL untuk tema stellar
      THEME_URL="https://github.com/DITZZZ112/foxhost/raw/main/C2.zip"
      ;;
    2)
      # URL untuk tema billing
      THEME_URL="https://github.com/DITZZZ112/foxhost/raw/main/C1.zip"
      ;;
    *)
      echo -e "Pilihan tidak ada,proses keluar dari script"
      exit 1
      ;;
  esac

  # Memastikan tidak ada file atau direktori bernama pterodactyl sebelum mengekstrak
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi

  # Mendownload dan mengekstrak tema
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"

  # Menginstal tema sesuai dengan pilihan pengguna
  if [ "$SELECT_THEME" -eq 1 ]; then
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    
    # Menyalin tema ke direktori panel Pterodactyl
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    
    # Instalasi dependensi
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl
    yarn add react-feather
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm /root/C2.zip
    sudo rm -rf /root/pterodactyl
    
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    exit 0
  
  elif [ "$SELECT_THEME" -eq 2 ]; then
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    
    # Menyalin tema ke direktori panel Pterodactyl
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    
    # Instalasi dependensi
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/pterodactyl
    yarn add react-feather
    php artisan billing:install stable
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm /root/C1.zip
    sudo rm -rf /root/pterodactyl
    
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    exit 0
  
  else
    echo "Pilihan tidak valid. silahkan pilih 1/2/3."
  fi
}

# Fungsi untuk menghapus tema Pterodactyl
uninstall_tema() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  # Menjalankan skrip untuk menghapus tema
  bash <(curl https://raw.githubusercontent.com/RexxHayanasi/PterodactlyAInstall/main/repair.sh)
  
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUCCES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
}

# Memilih aksi berdasarkan pilihan pengguna
case "$MENU_CHOICE" in
  1)
    install_panel
    ;;
  2)
    install_tema
    ;;
  3)
    uninstall_tema
    ;;
  *)
    echo "Pilihan tidak valid, keluar dari skrip."
    exit 1
    ;;
esac
