# Setup CUDA/cudnn/Tensorflow on CentOS 7

## Install nvidia driver

reference: [TITAN-V DRIVER FOR LINUX RHEL 7](https://www.nvidia.com/download/driverResults.aspx/128021/en-us)

```

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


## 安装CUDA

make sure download from [nvidia site](https://developer.nvidia.com/gpu-accelerated-libraries) and read [offical guide](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html)

- Check env

```
lspci | grep -i nvidia

```

如果没有安装gcc 4.8.5 `yum install gcc gcc-c++`

安装kernel headers和相关开发包 `yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r)`

- step 1, 卸载原来的CUDA

```
# 1. 通过runfile方式安装的
# 卸载cuda toolkit
sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl
# 卸载NVIDIA 驱动
sudo /usr/bin/nvidia-uninstall

# 2. 通过RPM/Deb方式安装的
sudo yum remove cuda*   #Redhat/CentOS
sudo apt-get --purge remove cuda*   #Ubuntu
```

### 安装方式-1 distribution-specific packages

- 从fedoraproject上面下载DMKS安装包，；安装DKMS依赖、安装DKMS包

```
wget https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/d/dkms-2.6.1-1.el7.noarch.rpm  ### Centos7 对应的安装包路径
yum install -y elfutils-libelf-devel
rpm -ivh dkms-2.4.0-1.20170926git959bd74.el7.noarch.rpm
```

- 下载、安装元数据包源


https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=CentOS&target_version=7&target_type=rpmlocal


```
wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-9-0-9.0.176-1.x86_64.rpm
sudo rpm -ivh cuda-9-0-9.0.176-1.x86_64.rpm
```

- 更新元数据 安装CUDA

```
sudo yum clean expire-cache
sudo yum update
sudo yum info cuda  # 当然如果你不放心的话，可以先执行查看CUDA包的相关信息。
sudo yum install cuda
sudo yum update cuda-drivers
```

- 检查安装是否成功

```
nvidia-smi
cat /usr/local/cuda/version.txt
```


### 安装方式-2 distribution-specific packages

TBA



## 安装 cudnn


```
tar -zxvf cudnn-8.0-linux-x64-v5.1.tgz
cd cuda && sudo cp lib64/* /usr/local/cuda/lib64/ && sudo cp include/cudnn.h /usr/local/cuda/include/
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
- cuddn version: "cudnn-8.0-linux-x64-v5.1.tgz" means cudnn v5.1 for CUDA 8.0;
- Tensorflow 1.3+ requires ducnn 6.0

## Reference

Useful links:
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
- https://www.cnblogs.com/WingPig/p/7897141.html

Show driver version

```
echo "nvidia driver version"
cat /proc/driver/nvidia/version && nvidia-smi
```

Uninstallation

```
echo "To uninstall the CUDA Toolkit"
sudo /usr/local/cuda-7.5/bin/uninstall_cuda_7.5.pl

echo "To uninstall the NVIDIA Driver, run nvidia-uninstall"
sudo /usr/bin/nvidia-uninstall

# If you installed CUDA 7.5 using the .deb package:
sudo apt-get purge cuda-7.5
```
