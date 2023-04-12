#!/bin/bash

mkdir /mydata
sudo /usr/local/etc/emulab/mkextrafs.pl /mydata
apt-get update
apt-get install git -y
git clone https://github.com/apache/openwhisk.git openwhisk
cd openwhisk/tools/ubuntu-setup && ./all.sh
systemctl stop docker.service
cd /etc/docker
echo {\"data-root\":\"/mydata/docker\"} > daemon.json
cd ~/openwhisk
systemctl daemon-reload
systemctl start docker.service
sudo apt-get install python-pip
sudo apt-get install npm -y
ENVIRONMENT=local
cd ~/openwhisk/ansible
ansible-playbook -i environments/$ENVIRONMENT setup.yml
ansible-playbook -i environments/$ENVIRONMENT setup.yml
cd ..
./gradlew distDocker
cd ansible
ansible-playbook -i environments/$ENVIRONMENT couchdb.yml
ansible-playbook -i environments/$ENVIRONMENT initdb.yml
ansible-playbook -i environments/$ENVIRONMENT wipe.yml
ansible-playbook -i environments/$ENVIRONMENT openwhisk.yml
wget https://github.com/apache/openwhisk-cli/releases/download/1.2.0/OpenWhisk_CLI-1.2.0-linux-amd64.tgz
tar -xvzf OpenWhisk_CLI-1.2.0-linux-amd64.tgz
mv wsk ~/openwhisk/bin
ansible-playbook -i environments/$ENVIRONMENT postdeploy.yml
ansible-playbook -i environments/$ENVIRONMENT apigateway.yml
ansible-playbook -i environments/$ENVIRONMENT routemgmt.yml
cd ~/openwhisk/bin
sudo timedatectl set-timezone UTC
export PATH=$PATH:$PWD
./wsk property set --apihost 172.17.0.1
result=$(./wskadmin  user create spark7)
wsk property set --auth $result
