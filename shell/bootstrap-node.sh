#!/usr/bin/env bash

source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

kubeadm join --token 123456.1234567890123456 --discovery-token-unsafe-skip-ca-verification 192.168.1.81:6443