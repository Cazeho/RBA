#!/bin/bash

cd /opt

# Create a directory for GitLab and enter it
mkdir gitlab
cd gitlab

# Create a Docker Compose file for GitLab
cat <<EOF > docker-compose.yml
version: '3'
services:
  web:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
	container_name: gitlab
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - './gitlab/config:/etc/gitlab'
      - './gitlab/logs:/var/log/gitlab'
      - './gitlab/data:/var/opt/gitlab'
EOF

# Start GitLab using Docker Compose
sudo docker-compose up -d


docker exec -it gitlab gitlab-rails runner "user = User.find_by(username: 'root'); user.password = '2833632791'; user.password_confirmation = '2833632791'; user.save!"
