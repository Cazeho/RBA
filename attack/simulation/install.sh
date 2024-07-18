apt update -qq
apt install -y python3-poetry
apt install -y python3-pip
apt install -y evil-winrm
apt install -y villain
apt install -y python3-impacket
apt install -y jq
apt install -y wordlists
apt install -y unzip

cd /opt/RBA/attack/
chmod +x install_ngrok.sh
./install_ngrok.sh

cd /opt/RBA/attack/simulation/tool
wget https://download.sysinternals.com/files/Procdump.zip
unzip Procdump.zip
rm -rf Procdump.zip

cd /opt/RBA/attack/simulation
poetry install
poetry shell
