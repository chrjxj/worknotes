# Setup CUDA/cudnn/Tensorflow on Ubuntu 16.04

## Install nvidia driver

```
# Remove anything linked to nvidia
sudo apt-get remove --purge nvidia* && sudo apt-get autoremove

# Search for your driver
apt search nvidia
# Select one driver (the last one is a decent choice)
sudo apt install nvidia-375
```

## Install Libs
```
sudo apt-get install -y --no-install-recommends build-essential cmake git pkg-config \
  libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler \
  libatlas-base-dev libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev

# Python 2.7 development files
sudo apt-get install -y python-pip python-dev python-numpy python-scipy libopencv-dev
# Python 3.5 development files
sudo apt-get install -y python3-dev python3-numpy python3-scipy libopencv-dev
```


## 安装CUDA and cudnn

- Check env
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
- step4, 安装CUDA，不要安装 openGL, 不要用CUDA自带的显卡驱动,
```
sudo ./cuda_8.0.61_375.26_linux.run
```

- step5, 安装 cudnn
```
tar -zxvf cudnn-8.0-linux-x64-v5.1.tgz
cd cudnn && sudo cp lib64/* /usr/local/cuda/lib64/ && sudo cp include/cudnn.h /usr/local/cuda/include/
```
- 安装完成后，修改 ~/.bashrc
```
vim ~/.bashrc
export CUDA_HOME=""/usr/local/cuda"
export PATH=""${CUDA_HOME}/bin/:$PATH"
export LD_LIBRARY_PATH=""$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64"
```

- 测试
```
nvidia-smi
cd ~/NVIDIA_CUDA-8.0_Samples
make all -j4
~/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/deviceQuery
```

## Install Tensorflow
[Tensorflow.org install Guide](https://www.tensorflow.org/install/install_linux#InstallingNativePip)
```
pip install tensorflow-gpu==1.2
pip install keras
```

NOTE:

- Tensorflow 1.3 require different ducnn lib


## Reference
http://shomy.top/2016/12/29/gpu-tensorflow-install/
http://www.jianshu.com/p/f459f4ab0d99
https://github.com/BVLC/caffe/wiki/Ubuntu-16.04-or-15.10-Installation-Guide
