cd /opt

sudo apt-get update -y

# terraform

sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp-archive-keyring.gpg
sudo mv hashicorp-archive-keyring.gpg /usr/share/keyrings/
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update
sudo apt-get install terraform

# aws cli

sudo apt-get install -y curl unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
rm -rf aws

apt update -y

# attack range

git clone https://github.com/splunk/attack_range.git
cd attack_range

# poetry

apt install python3-poetry -y
poetry shell

# depedencies

wget https://github.com/Cazeho/RBA/blob/main/install/rq.txt
pip install -r rq.txt
