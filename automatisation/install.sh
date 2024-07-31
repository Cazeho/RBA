#!/bin/bash

cd /opt

mkdir gitlab
cd gitlab

docker compose up -d
docker exec -it gitlab gitlab-rails runner "user = User.find_by(username: 'root'); user.password = 'Password123!'; user.password_confirmation = 'Password123!'; user.save!"
