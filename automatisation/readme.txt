# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start




sudo gitlab-runner register --url http://<your_domain>/ --registration-token <your_token>


cat /etc/gitlab-runner/config.toml



add <your_domain> domain in /etc/hosts in twice gitalb and splunk


comment all in /home/gitlab-runner/.bash_logout

su - gitlab-runner

gitlab-runner@splunk:~/builds/o3Gfuyd-/0/root/detection_rule
 
 in root

sudo usermod -aG sudo gitlab-runner
sudo groups gitlab-runner
 

 sudo passwd gitlab-runner
 
 visudo
 
 gitlab-runner ALL=(ALL) NOPASSWD: /usr/bin/cp /opt/splunk/etc/apps/SplunkEnterpriseSecuritySuite/local/savedsearches.conf, /opt/splunk/bin/splunk
