#!/bin/bash

cd /opt

mkdir gitlab
cd gitlab

curl -s https://raw.githubusercontent.com/Cazeho/download_project/main/docker_ubuntu.sh | bash

docker compose up -d
docker exec -it gitlab gitlab-rails runner "user = User.find_by(username: 'root'); user.password = 'Password123!'; user.password_confirmation = 'Password123!'; user.save!"
