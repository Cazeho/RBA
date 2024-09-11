apt update

# install Splunk

wget -O splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz"
tar -xzf splunk-9.0.4.1-419ad9369127-Linux-x86_64.tgz -C /opt
echo 'export PATH=$PATH:/opt/splunk/bin' >> ~/.bashrc
source ~/.bashrc

splunk start --accept-license --answer-yes --no-prompt --seed-passwd '2833632791'
splunk enable boot-start
