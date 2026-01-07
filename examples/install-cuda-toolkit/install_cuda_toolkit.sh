#!/bin/bash
set -ex

echo "--- [SETUP] Starting NVIDIA CUDA Toolkit Installation ---"

export DEBIAN_FRONTEND=noninteractive

# 1. Update packages and install prerequisites
sudo apt-get update -y
sudo apt-get install -y wget

# 2. Add the NVIDIA CUDA repository
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb -P /tmp
sudo dpkg -i /tmp/cuda-keyring_1.1-1_all.deb
sudo apt-get update -y

# 3. Install the CUDA toolkit (which includes the driver)
sudo apt-get -y install cuda

# 4. Clean up
sudo rm /tmp/cuda-keyring_1.1-1_all.deb
sudo apt-get autoremove -y
sudo apt-get clean

echo "--- [SUCCESS] NVIDIA CUDA Toolkit installation is complete. ---"
