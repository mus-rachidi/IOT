#!/bin/bash
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.epel.cloud|g' /etc/yum.repos.d/CentOS-linux*

yum update -y
export INSTALL_K3S_EXEC="agent  --server https://${MASTER_IP}:6443 --token-file /home/vagrant/sync/confs/node-token --node-ip=${WORKER_IP}"
curl -sfL https://get.k3s.io |  sh -
echo "alias k='k3s kubectl'" >> /etc/profile.d/apps-bin-path.sh
yum -y install net-tools
