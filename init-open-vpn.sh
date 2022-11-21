#!/bin/bash
sudo yum update -y && sudo yum install -y docker && sudo sudo yum install -y git
sudo systemctl start docker
sudo usermod -aG docker ec2-user
sudo git clone https://github.com/kylemanna/docker-openvpn.git
cd docker-openvpn/
docker build -t myownvpn .
cd ..
mkdir vpn-data && touch vpn-data/vars
