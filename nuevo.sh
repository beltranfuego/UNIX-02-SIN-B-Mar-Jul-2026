sudo apt update
sudo apt upgrade
sudo apt install parted
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"