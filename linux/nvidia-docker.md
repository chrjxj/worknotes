# Docker

## Docker Usage

References:
- [Docker常用命令](http://www.jianshu.com/p/ff58311b0d06)
- [Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice/content/)




### nvidia-docker

- DO NOT USE commands and steps in https://github.com/NVIDIA/nvidia-docker

- Instead, go to https://github.com/NVIDIA/nvidia-docker/releases and download nvidia-docker_*.deb

```
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i nvidia-docker*.deb
echo 'make sure to install nvidia-modprobe'
sudo apt install nvidia-modprobe
echo 'make sure to reboot and check if nvidia-docker start with system boot'
sudo reboot
journalctl -n -u nvidia-docker
```
