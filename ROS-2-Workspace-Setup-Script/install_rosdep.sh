#!/bin/bash

# Renk tanımları
GREEN='\e[32m'    # Yeşil (Bilgilendirme)
YELLOW='\e[33m'   # Sarı (Sorular)
CYAN='\e[36m'     # Mavi (y/n seçenekleri)
RESET='\e[0m'     # Renk sıfırlama

echo -e "${YELLOW}Lütfen ROS 2 workspace dizininizi giriniz (örneğin: /home/user/ros2_ws):${RESET}"
read -p "" ros2_ws_path

# Belirtilen dizine git
if [ -d "$ros2_ws_path" ]; then
    cd "$ros2_ws_path"
    echo -e "${GREEN}Dizin değiştirildi: $(pwd)${RESET}"
else
    echo -e "${YELLOW}Hata: Belirtilen dizin bulunamadı!${RESET}"
    exit 1
fi

echo -e "${YELLOW}sudo apt install python3-rosdep2 çalıştırmak ister misiniz?${CYAN} (y/n):${RESET}"
read -p "" answer
answer=${answer:-y}
[[ $answer =~ ^[Yy]$ ]] && sudo apt install python3-rosdep2

echo -e "${YELLOW}rosdep update çalıştırmak ister misiniz?${CYAN} (y/n):${RESET}"
read -p "" answer
answer=${answer:-y}
[[ $answer =~ ^[Yy]$ ]] && rosdep update

echo -e "${YELLOW}ROS 2 dağıtımınızı girin (örneğin: humble, jazzy):${RESET}"
read -p "" ros2_distribution

echo -e "${YELLOW}rosdep install -i --from-path src --rosdistro $ros2_distribution -y çalıştırmak ister misiniz?${CYAN} (y/n):${RESET}"
read -p "" answer
answer=${answer:-y}
[[ $answer =~ ^[Yy]$ ]] && rosdep install -i --from-path src --rosdistro $ros2_distribution -y

echo -e "${YELLOW}colcon build çalıştırmak ister misiniz?${CYAN} (y/n):${RESET}"
read -p "" answer
answer=${answer:-y}
[[ $answer =~ ^[Yy]$ ]] && colcon build

echo -e "${GREEN}source install/setup.bash${RESET}"
source install/setup.bash

echo -e "${YELLOW}ROS 2 workspace'inizin setup.bash dosyasının yolunu girin (örneğin: /home/user/ros2_ws/install/setup.bash):${RESET}"
read -p "" setup_bash_path

echo -e "${YELLOW}echo 'source $setup_bash_path' >> ~/.bashrc çalıştırmak ister misiniz?${CYAN} (y/n):${RESET}"
read -p "" answer
answer=${answer:-y}
[[ $answer =~ ^[Yy]$ ]] && echo "source $setup_bash_path" >> ~/.bashrc
