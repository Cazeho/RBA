apt update -y
apt install -y python3 python3-pip
apt install -y python3-impacket
apt install -y python3-poetry

#apt install -y python3.11-venv



cd /opt
mkdir attack
cd attack

git clone  https://github.com/Xre0uS/MultiDump.git

# install Netexec

cd /opt/attack

git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
poetry shell
poetry install
pip install kerbrute

#python3 -m venv .
#source bin/activate
#pip install .

pip install kerbrute

# install Villain C2

cd /opt/attack

apt update -y && apt install -y gnome-terminal
git clone https://github.com/t3l3machus/Villain.git
cd ./Villain
pip3 install -r requirements.txt

# install Binary (Mimikatz...etc)

cd /opt/attack
mkdir bin
cd bin
wget -O mimikatz.exe "https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimikatz.exe?ref_type=heads"
