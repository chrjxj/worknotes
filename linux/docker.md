# Docker


### Install Docker Xenial 16.04

Installation for :
- see [home page](https://docs.docker.com/engine/installation/linux/ubuntu/) or  [guide](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
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
sudo usermod -a -G docker ${USR}
sudo service docker restart
```


### Docker Command and Usage

[Docker常用命令](http://www.jianshu.com/p/ff58311b0d06)
[Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice/content/)


- docker可以支持把一个宿主机上的目录挂载到镜像里 ```docker run -it -v /mnt/docker_ubuntu:/usr/Downloads ubuntu64 /bin/bash```
- ```docker run -it --rm -p 8888:8888 -v /mnt/docker_ubuntu:/usr/Downloads jupyter/scipy-notebook```
- docker 的容器自动在开机启动   ```sudo docker run --restart=always ..```  



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
    --name ipsec-vpn-server \
    --env-file ~/docker_vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server

#### ubuntu 服务器
docker pull ubuntu:16.04

docker run \
    --name medical-dev \
    --restart=always \
    -p 58888:8888 \
    -d --privileged \
    ubuntu:16.04


### Docker Command Reference

```
    attach    Attach to a running container
    build     Build an image from a Dockerfile
    commit    Create a new image from a container's changes
    cp        Copy files/folders between a container and the local filesystem
    create    Create a new container
    diff      Inspect changes on a container's filesystem
    events    Get real time events from the server
    exec      Run a command in a running container
    export    Export a container's filesystem as a tar archive
    history   Show the history of an image
    images    List images
    import    Import the contents from a tarball to create a filesystem image
    info      Display system-wide information
    inspect   Return low-level information on a container or image
    kill      Kill a running container
    load      Load an image from a tar archive or STDIN
    login     Log in to a Docker registry
    logout    Log out from a Docker registry
    logs      Fetch the logs of a container
    network   Manage Docker networks
    pause     Pause all processes within a container
    port      List port mappings or a specific mapping for the CONTAINER
    ps        List containers
    pull      Pull an image or a repository from a registry
    push      Push an image or a repository to a registry
    rename    Rename a container
    restart   Restart a container
    rm        Remove one or more containers
    rmi       Remove one or more images
    run       Run a command in a new container
    save      Save one or more images to a tar archive
    search    Search the Docker Hub for images
    start     Start one or more stopped containers
    stats     Display a live stream of container(s) resource usage statistics
    stop      Stop a running container
    tag       Tag an image into a repository
    top       Display the running processes of a container
    unpause   Unpause all processes within a container
    update    Update configuration of one or more containers
    version   Show the Docker version information
    volume    Manage Docker volumes
    wait      Block until a container stops, then print its exit code
```
