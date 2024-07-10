apt update
apt install -y python3-poetry
apt install -y python3-pip
apt install -y evil-winrm
apt install -y villain

/opt/RBA/attack/simulation/poetry install
/opt/RBA/attack/simulation/poetry shell
