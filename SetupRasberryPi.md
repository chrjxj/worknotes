# Setup OpenCV and Openface on Rasberry Pi 3

System:

- Rasberry Pi 3, ARMv7, 1G RAM, 32G SD card
- Linux: Linux raspberrypi 4.4.50-v7+ #970 SMP Mon Feb 20 19:18:29 GMT 2017 armv7l GNU/Linux

Goal:

- Install OpenCV
- Setup openface

http://blog.csdn.net/sdhfaka/article/details/22040527

```
sudo apt-get install build-essential python-dev python-numpy python-setuptools python-scipy libatlas-dev libatlas3-base  
sudo apt-get install python-matplotlib
sudo apt-get install python-pip

sudo pip install -U scikit-learn
or
sudo pip install scikit-learn 
sudo pip install scikit-image

pip list
```

test import in python 
```
import numpy
import scipy
import sklearn
import skimage
```



## Install OpenCV and Openface

http://www.linuxdiyf.com/linux/20268.html


### install pkg
```
#!/bin/sh 
sudo apt-get install build-essential -y 
sudo apt-get install cmake -y 
sudo apt-get install curl -y 
sudo apt-get install gfortran -y 
sudo apt-get install git -y 
sudo apt-get install libatlas-dev -y 
sudo apt-get install libavcodec-dev -y 
sudo apt-get install libavformat-dev -y 
sudo apt-get install libboost-all-dev -y 
sudo apt-get install libgtk2.0-dev -y 
sudo apt-get install libjpeg-dev -y 
sudo apt-get install liblapack-dev -y 
sudo apt-get install libswscale-dev -y 
sudo apt-get install pkg-config -y 
sudo apt-get install python-dev -y 
sudo apt-get install python-pip -y 
sudo apt-get install wget -y 
sudo apt-get install zip –y 
```

http://scikit-learn.org/stable/developers/advanced_installation.html
```


### install Torch

```
a.安装依赖
curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps  | bash –e
b.安装
git clone https://github.com/torch/distro.git ~/torch --recursive 
cd ~/torch && ./install.sh 
c.安装依赖
luarocks install $NAME, where $NAME is as listed below.
dpnn
nn
csvigo
cunn (使用CUDA)
fblualib  (仅为了训练DNN)
torchx  (仅为了训练DNN)
命令行，按照需要安装：
~/torch/install/bin/luarocks install dpnn 
~/torch/install/bin/luarocks install nn 
~/torch/install/bin/luarocks install optim 
~/torch/install/bin/luarocks install csvigo 
~/torch/install/bin/luarocks install cunn 
~/torch/install/bin/luarocks install fblualib 
~/torch/install/bin/luarocks install torchx 
d.验证是否安装依赖成功
用th命令验证
注意：
a.gitclone更新网络老中断
git submodule update --init –recursive
或者torch目录下的
Update.sh
建议用Update.sh解决
b.错误：
Cloning into'extra/luaffifb'...
remote:Counting objects: 918, done.
error: RPCfailed; result=56, HTTP code = 200| 0 bytes/s
fatal: Theremote end hung up unexpectedly
fatal: earlyEOF
fatal:index-pack failed
Clone of 'https://github.com/facebook/luaffifb' intosubmodule path 'extra/luaffifb' failed
解决：
git config --global http.postBuffer 524288000 
```


### install opencv

install guide: http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
note: opencv 3.x worked in my test

```
download and unzip opencv from offical website
cd  opencv-2.4.11 
mkdir  release 
cd  release 
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. 
make  -j8
make install

# go to python console and check 
import cv2
```

### 安装dlib

```
download source code from http://dlib.net/
sudo python setup.py install

# make sure 'install' the compiled bin to python lib path
cp dlib.so /usr/local/lib/python2.7/dist-packages 
# go to python console and check
import dlib 
```

### openface

python2一定要确保dlib和opencv安装成功
import cv2
import dlib 

```
git clone https://github.com/cmusatyalab/openface.git 
git submodule init 
git submodule update 

# in Openface root dir
sudo python2 setup.py install 

# 获取模型
models/get-models.sh 


# 运行demo1：
./demos/compare.pyimages/examples/{lennon*,clapton*}
#运行demo2：
./demos/classifier.py infermodels/openface/celeb-classifier.nn4.small2.v1.pkl ./images/examples/carell.jpg
# 运行demo3：
./demos/web/start-servers.sh

9、demo1可用浏览器
可用浏览器：
360浏览器极速模式
火狐浏览器
搜狗浏览器高速模式
不可用浏览器：
Chrome谷歌浏览器（可能与浏览器更新有关系，getUserMedia()）
IE浏览器
```

