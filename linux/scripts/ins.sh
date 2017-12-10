#!/bin/bash

echo 'install very basic tools'
sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    openssh-server openssh-client vim wget vim-* vnc4server screen apache2

echo 'Install shadowsocks, Sublime Text 3, and Atom'
sudo add-apt-repository ppa:hzwhuang/ss-qt5 && sudo add-apt-repository ppa:webupd8team/atom && \
  sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends \
  shadowsocks-qt5 sublime-text atom

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
