# Setup CUDA and Tensorflow on Ubuntu 16.04 # 


## Install reference:

http://shomy.top/2016/12/29/gpu-tensorflow-install/ 
http://www.jianshu.com/p/f459f4ab0d99

https://github.com/BVLC/caffe/wiki/Ubuntu-16.04-or-15.10-Installation-Guide

## Env

```

sudo apt-get install -y build-essential cmake git pkg-config

sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler

sudo apt-get install -y libatlas-base-dev 

sudo apt-get install -y --no-install-recommends libboost-all-dev

sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

# Python 2.7 development files
sudo apt-get install -y python-pip python-dev python-numpy python-scipy libopencv-dev
# Python 3.5 development files
sudo apt-get install -y python3-dev python3-numpy python3-scipy libopencv-dev
```


## 安装CUDA and cudnn

- Check env before start

```
lspci -vnn | grep -i VGA -A 12
sudo apt-cache search nvidia | grep -P '^nvidia-[0-9]+\s'
```

- step 1, 从nvidia.com下载 [CUDA](https://developer.nvidia.com/cuda-downloads) and [cudnn](https://developer.nvidia.com/cudnn) 
- step 2, 禁用开源驱动 ```vim /etc/modprobe.d/blacklist-nouveau.conf```, 文件内容入下，最后更新 ```sudo update-initramfs -u```
```
blacklist nouveau
options nouveau modeset=0
```
- setp3, 关闭X server
```
sudo /etc/init.d/gdm stop
sudo /etc/init.d/gdm status
```

- step4, 安装CUDA，不要安装 openGL, 不要用CUDA自带的显卡驱动, 安装完成后，修改 ~/.bashrc
```
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
```

- step5, 安装 cudnn
```
tar -zxvf cudnn-8.0-linux-x64-v5.1.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/cudnn.h /usr/local/cuda/include/
```
```
vim ~/.bashrc
export CUDA_HOME=/usr/local/cuda
export PATH=${CUDA_HOME}/bin/:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64
```

- 测试
```
cd /path/to/NVIDIA_CUDA-8.0_Samples
make all -j4
/path/to/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/deviceQuery    
```



## Install tensorflow

[Install Tensorflow](https://www.tensorflow.org/install/install_linux#InstallingNativePip)

```
pip install tensorflow-gpu==1.2 
pip install keras
```

NOTE:

- Tensorflow 1.3 require different ducnn lib
