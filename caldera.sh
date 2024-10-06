curl -s https://raw.githubusercontent.com/Cazeho/download_project/main/docker_ubuntu.sh | bash

cd /opt
git clone https://github.com/mitre/caldera.git --recursive
cd caldera
docker build . --build-arg WIN_BUILD=true -t caldera:latest
docker run -p 8888:8888 caldera:latest
