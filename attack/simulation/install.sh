apt update
apt install -y python3-poetry
apt install -y python3-pip
apt install -y evil-winrm
apt install -y villain
apt install -y python3-impacket
apt install -y jq

cd /opt/RBA/attack/simulation
poetry install
poetry shell
