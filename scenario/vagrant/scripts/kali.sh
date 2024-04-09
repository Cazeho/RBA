apt update
apt install -y python3 python3-pip
apt install -y python3-impacket
apt install -y python3.11-venv
apt purge -y powershell-empire
apt install -y powershell-empire starkiller
pip install kerbrute

cd /opt
mkdir attack
cd attack

git clone  https://github.com/Xre0uS/MultiDump.git


cd /opt/attack

git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
python3 -m venv .
source bin/activate
pip install .






