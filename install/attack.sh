apt update -y
apt install -y python3 python3-pip
apt install -y python3-impacket
apt install -y python3.11-venv
pip install kerbrute

cd /opt
mkdir attack
cd attack

git clone  https://github.com/Xre0uS/MultiDump.git

# install Netexec

cd /opt/attack

git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
python3 -m venv .
source bin/activate
pip install .

# install Villain C2

cd /opt/attack

apt update -y && apt install -y gnome-terminal
git clone https://github.com/t3l3machus/Villain.git
cd ./Villain
pip3 install -r requirements.txt

# install Binary (Mimikatz...etc)

cd /opt/attack

wget -O mimikatz.exe "https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimikatz.exe?ref_type=heads"
