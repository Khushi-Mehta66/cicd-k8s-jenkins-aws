#!/bin/bash

# Add host entries
echo "10.0.22.9  master" | sudo tee -a /etc/hosts
echo "10.0.21.90  slave00" | sudo tee -a /etc/hosts
 

# Set hostname
sudo hostnamectl set-hostname master

# Disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Disable firewall (optional - Ubuntu uses ufw)
sudo systemctl disable --now ufw

# Disable SELinux (not used in Ubuntu, skip)

# Load kernel modules
sudo modprobe overlay
sudo modprobe br_netfilter

# Persist kernel module loading
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# Configure sysctl
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system

# Install required packages
sudo apt-get update && sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common \
    containerd \
    wget \
    git \
    vim

# Configure containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# Enable systemd cgroup driver
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

# Restart containerd
sudo systemctl restart containerd
sudo systemctl enable containerd

# Add Kubernetes APT repository
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes.gpg
echo "deb https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install Kubernetes tools
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Enable kubelet
sudo systemctl enable kubelet

# Initialize the Kubernetes cluster
sudo kubeadm init --pod-network-cidr=172.16.0.0/16

# Set up local kubeconfig for current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install Calico CNI plugin
curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.26.3/manifests/calico.yaml
kubectl apply -f calico.yaml

# Show status
kubectl get nodes
kubectl get pods -A

# Example kubeadm join command for workers (replace token/hash as needed)
echo "kubeadm join 192.168.122.101:6443 --token <your-token> --discovery-token-ca-cert-hash sha256:<your-hash>"

