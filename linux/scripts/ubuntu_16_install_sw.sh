#!/bin/bash

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ./settings/sources.list /etc/apt/sources.list 
sudo mkdir -p /etc/docker/ && sudo cp ./settings/etc_docker_daemon.json /etc/docker/daemon.json
sudo mkdir -p /etc/shadowsocks/ && sudo cp ./settings/etc_shadowsocks_config.json /etc/shadowsocks/config.json
sudo mkdir -p /etc/polipo/ && sudo cp ./settings/etc_polipo_config.json /etc/polipo/config


sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo add-apt-repository ppa:hzwhuang/ss-qt5 && sudo add-apt-repository ppa:webupd8team/atom

sudo apt-get remove vim-*

echo 'install very basic tools'
sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    openssh-server openssh-client vim wget vim-* vnc4server screen apache2

echo 'Install shadowsocks, Sublime Text 3, and Atom'
sudo add-apt-repository ppa:hzwhuang/ss-qt5 && sudo add-apt-repository ppa:webupd8team/atom && \
  sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends \
  shadowsocks-qt5 sublime-text atom


sudo apt purge -y libreoffice-common unity-webapps-common thunderbird totem rhythmbox empathy \
                    brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese gnome-sudoku \
                    transmission-common gnome-orca webbrowser-app landscape-client-ui-install deja-dup




sudo apt-get update && sudo apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev python-pip python3-pip python3-dev python-virtualenv python-setuptools \
        python-scipy python-numpy

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
sudo apt-get update && \
sudo apt-get install -y google-chrome-stable

