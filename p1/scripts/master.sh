#!/bin/bash
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.epel.cloud|g' /etc/yum.repos.d/CentOS-Linux-*
yum install -y centos-release
yum update -y

export INSTALL_K3S_EXEC="server --write-kubeconfig-mode 644  --advertise-address=${MASTER_IP} --node-ip=${MASTER_IP}"
curl -sfL https://get.k3s.io |  sh -
cp /var/lib/rancher/k3s/server/node-token /home/vagrant/sync/confs/
echo "alias k='k3s kubectl'" >> /etc/profile.d/apps-bin-path.sh
yum -y install net-tools