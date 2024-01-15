#!/bin/bash

git clone https://github.com/cackoarek/docker-big-data.git
cd docker-big-data/spark-jupyter/
docker-compose up -d

PUBLIC_IP=$(curl -s https://checkip.amazonaws.com)
echo -e "\n Access jupyter via http://localhost:8888\nor public:\n http://$PUBLIC_IP:8888\n Need open port? Run:\n open_specific_port_public.sh 8888"