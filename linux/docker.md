# Docker

## Docker Usage

References:
- [Docker常用命令](http://www.jianshu.com/p/ff58311b0d06)
- [Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice/content/)

### Docker Commands

- 挂载宿主机上目录到镜像 ```docker run -it -v /mnt/docker_ubuntu:/usr/Downloads ubuntu64 /bin/bash```
- run a container: ```docker run -it --rm -p 8888:8888 -v /mnt/docker_ubuntu:/usr/Downloads jupyter/scipy-notebook```
- docker 的容器自动在开机启动```sudo docker run --restart=always ..```  
- 登陆（链接）到容器: ```PID=$(docker inspect --format "{{ .State.Pid }}" <container>)``` and then ```nsenter --target $PID --mount --uts --ipc --net --pid```
- 文件在host和docker container之间拷贝: ```docker cp <containerId>:/file/path/within/container /host/path/target```


#### docker save, export, load and import

- 导出(Export): Export命令用于持久化容器（不是镜像）: ```sudo docker export <CONTAINER ID> > export.tar```
- 保存(Save)Save命令用于持久化镜像（不是容器）： ```sudo docker save <IMAGE NAME or ID> > save.tar```

- docker load用来载入镜像包: ``` sudo docker load < save.tar```
- docker import用来载入容器包:
- docker load 和 import 两者都会恢复为镜像；
- docker load不能对载入的镜像重命名，而docker import可以为镜像指定新名称


### Docker Applications

#### 搭建 Jupyter 服务器

https://hub.docker.com/r/jupyter/

#### 搭建Shadowsocks服务器

[使用Docker快速搭建Shadowsocks服务器](http://www.jianshu.com/p/8535c9ddedc1)

```
docker pull oddrationale/docker-shadowsocks
docker run --name ss_server --restart=always -d -p 54001:54001 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 54001 -k whatsupec2 -m aes-256-cfb
```

- d——容器启动后会进入后台
- p（第一个）——指定要映射的端口，使用的格式是hostPort:containerPort，即本地的 54285 端口映射到容器的 54285 端口
- s——服务器IP
- p（第二个）——代理端口
- yourpasswd——你的密码

#### 搭建ipsec-vpn-server服务器

https://hub.docker.com/r/hwdsl2/ipsec-vpn-server/

docker run \
 --name ipsec-vpn-server  --env-file ~/docker_vpn.env \
 --restart=always -p 500:500/udp -p 4500:4500/udp \
 -v /lib/modules:/lib/modules:ro -d --privileged hwdsl2/ipsec-vpn-server

#### ubuntu 服务器

```
docker pull ubuntu:16.04
docker run  --name medical-dev  --restart=always  -p 58888:8888  -d --privileged  ubuntu:16.04
```

## Nvidia-Docker



### Setup Nvidia-Docker

- DO NOT USE commands and steps in https://github.com/NVIDIA/nvidia-docker

- Instead, go to https://github.com/NVIDIA/nvidia-docker/releases and download nvidia-docker_*.deb; sample command:

```
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i nvidia-docker*.deb
echo 'make sure to install nvidia-modprobe'
sudo apt install nvidia-modprobe
echo 'make sure to reboot and check if nvidia-docker start with system boot'
sudo reboot
journalctl -n -u nvidia-docker
```

### Use Nvidia-Docker and GPU in Dockerfile

https://stackoverflow.com/questions/41346401/use-nvidia-docker-compose-launch-a-container-but-exited-soon
https://stackoverflow.com/questions/41346401/use-nvidia-docker-compose-launch-a-container-but-exited-soon#comment73796775_41947086

384.90

docker volume create --name=nvidia_driver_384.90 -d nvidia-docker

docker volume create --name=nvidia_driver_367.57 -d nvidia-docker

## Appendix

### Install Docker Xenial 16.04

- see [docker official docs](https://docs.docker.com/engine/installation/linux/ubuntu/) or  [guide](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)

```
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update

sudo apt-get install \
 linux-image-extra-$(uname -r) \
 linux-image-extra-virtual

sudo apt-get update
sudo apt-get install \
 apt-transport-https \
 ca-certificates \
 curl \
 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker
sudo usermod -a -G docker ${USER}
sudo service docker restart
```

#### Docker Command List

```
 attach Attach to a running container
 build  Build an image from a Dockerfile
 commit Create a new image from a container's changes
 cp  Copy files/folders between a container and the local filesystem
 create Create a new container
 diffInspect changes on a container's filesystem
 events Get real time events from the server
 execRun a command in a running container
 export Export a container's filesystem as a tar archive
 historyShow the history of an image
 images List images
 import Import the contents from a tarball to create a filesystem image
 infoDisplay system-wide information
 inspectReturn low-level information on a container or image
 killKill a running container
 loadLoad an image from a tar archive or STDIN
 login  Log in to a Docker registry
 logout Log out from a Docker registry
 logsFetch the logs of a container
 networkManage Docker networks
 pause  Pause all processes within a container
 portList port mappings or a specific mapping for the CONTAINER
 ps  List containers
 pullPull an image or a repository from a registry
 pushPush an image or a repository to a registry
 rename Rename a container
 restartRestart a container
 rm  Remove one or more containers
 rmi Remove one or more images
 run Run a command in a new container
 saveSave one or more images to a tar archive
 search Search the Docker Hub for images
 start  Start one or more stopped containers
 stats  Display a live stream of container(s) resource usage statistics
 stopStop a running container
 tag Tag an image into a repository
 top Display the running processes of a container
 unpauseUnpause all processes within a container
 update Update configuration of one or more containers
 versionShow the Docker version information
 volume Manage Docker volumes
 waitBlock until a container stops, then print its exit code
```
