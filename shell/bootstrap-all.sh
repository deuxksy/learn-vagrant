#!/usr/bin/env bash


ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

date

# Letting iptables see bridged traffic 
cat <<EOF | tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

systemctl stop firewalld
systemctl disable firewalld

# setenforce 0
# sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config


echo "update && upgrade"
apt-get update && apt-get full-upgrade -y

echo "install"
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y 

echo "docker.gpg"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "k8s.gpg"
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

echo "update"
apt-get update

echo "docker install"
apt-get install docker-ce docker-ce-cli containerd.io -y 

# swapoff
swapoff -a && sed -i '/swap/s/^/#/' /etc/fstab

echo "k8s install"
apt-get install kubelet kubeadm kubectl -y 
apt-mark hold kubelet kubeadm kubectl

systemctl start kubelet
systemctl enable kubelet

date