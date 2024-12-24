# use kali distro


apt update
cd /opt
git clone https://github.com/mitre/caldera.git --recursive
cd caldera
# set venv
pip3 install -r requirements.txt
git submodule add https://github.com/mitre/magma
cd plugins/magma && npm install && cd ..
cd ../..
apt install npm -y
python3 server.py --insecure --build
