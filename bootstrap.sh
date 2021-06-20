#!/usr/bin/env bash

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

echo "k8s install"
apt-get install kubelet kubeadm kubectl -y 
apt-mark hold kubelet kubeadm kubectl