# Ubuntu 16.04上安装英伟达驱动和CUDA

```
系统：Ubuntu16.04 64bit
显卡：Nvidia GFoce GTX TITAN X
驱动：nvidia 375.20
软件版本：cuda8.0 + cudnn5.0
```


## 安装Nvidia驱动

找到适合的正确的驱动去nvidia驱动官网下载 run

卸载掉原有驱动
  * sudo apt-get remove --purge '^nvidia-.*'
  * 如果使用的是apt-get安装可以使用这种方法卸载，如果使用的是runfile，则使用--uninstall命令，当然runfile安装的时候会卸载掉之前的驱动，所以可以不用手动去卸载。

禁用nouveau

- 打开编辑配置文件： `/etc/modprobe.d/blacklist.conf` 在最后一行添加：`blacklist nouveau`
- 禁用nouveau第三方驱动，之后也不需要改回来
- 执行：`sudo update-initramfs -u` and then `reboot`
- 重启后执行： `lsmod | grep nouveau` 没有输出即屏蔽好了

禁用X服务 `sudo /etc/init.d/lightdm stop`

安装驱动

- 进入命令行界面 `Ctrl-Alt+F1`
- 给驱动run文件赋予执行权限 `sudo chmod a+x NVIDIA-Linux-x86_64-375.20.run`
- 安装(注意 参数!!!): `sudo ./NVIDIA-Linux-x86_64-375.20.run --no-opengl-files --no-nouveau-check --no-x-check`

  * no-opengl-files 只安装驱动文件，不安装OpenGL文件。这个参数最重要
  * no-x-check 安装驱动时不检查X服务
  * no-nouveau-check 安装驱动时不检查nouveau

  - 后面两个参数可不加。
  - 禁忌安装CUDA时一定使用runfile文件，这样可以进行选择。不再选择安装驱动，以及在弹出xorg.conf时选择 NO
  - 不要使用ubuntu设置中附加驱动中驱动
  - 如果出现无法进入桌面的问题，这是因为驱动修改了xorg的配置，可执行一下命令：

  ```
  cd /usr/share/X11/xorg.conf.d/
  sudo mv nvidia-drm-outputclass.conf nvidia-drm-outputclass.conf.bak
  ```

检查: `nvidia-smi`


## 安装 CUDA和 cuDNN

make sure download from [nvidia site](https://developer.nvidia.com/gpu-accelerated-libraries) and read [offical guide](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html)


- 安装CUDA，不要安装 openGL, 不要用CUDA自带的显卡驱动,
```
sudo sh cuda_8.0.61_375.26_linux.run
```

- step5, 安装 cudnn

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

make sure download from [nvidia site](https://developer.nvidia.com/gpu-accelerated-libraries) and read [offical guide](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html)

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
pip install tensorflow-gpu==1.2 keras
```

NOTE:
- cuddn version: "cudnn-8.0-linux-x64-v5.1.tgz" means cudnn v5.1 for CUDA 8.0;
- Tensorflow 1.3+ requires ducnn 6.0

## Reference

Useful links:
- http://shomy.top/2016/12/29/gpu-tensorflow-install/
- http://www.jianshu.com/p/f459f4ab0d99
- https://github.com/BVLC/caffe/wiki/Ubuntu-16.04-or-15.10-Installation-Guide
- https://blog.csdn.net/u012759136/article/details/53355781

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

## Tensorflow vs. CUDA/cudnn Versions

reference: 

- [TF vs. CUDA/cuDNN versions](https://www.tensorflow.org/install/source?hl=zh-cn#linux)
- [CUDA vs. GPU Driver versions](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html)

![Linux](assets/20190708213655564.png)

![Windows](assets/20190708213810637.png)


