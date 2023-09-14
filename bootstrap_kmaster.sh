#!/bin/bash

echo "[TASK 1] Pull required containers"
kubeadm config images pull >/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=192.168.121.210 --pod-network-cidr=172.120.0.0/16 >> /root/kubeinit.log 2>/dev/null

echo "[TASK 3] Add kubeconfig file"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config

echo "[TASK 4] Deploy Calico network"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1

echo "[TASK 5] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh 2>/dev/null

echo "[TASK 6] Kubectl Autocomplete in Bash"
sudo apt-get install bash-completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo "alias k='kubectl'" >> ~/.bashrc
source ~/.bashrc

