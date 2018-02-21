# Mirror sites for Python #

## Python (conda/pip)

创建打开 pip 源配置文件 ```mkdir ~/.pip && touch ~/.pip/pip.conf && vim ~/.pip/pip.conf```

```
[global]
trusted-host = mirrors.aliyun.com
index-url = http://mirrors.aliyun.com/pypi/simple/
```

#### 手动指定源

可以在pip后面跟-i 来指定源

```
pip install \
  -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
  https://mirrors.tuna.tsinghua.edu.cn/tensorflow/linux/gpu/tensorflow_gpu-1.4.0-cp36-cp36m-linux_x86_64.whl
```

conda 添加源

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```


## 国内一些镜像站点

pipy国内镜像
```
http://mirrors.aliyun.com/pypi/simple/ 阿里云
http://pypi.mirrors.ustc.edu.cn/ 中国科学技术大学
https://pypi.tuna.tsinghua.edu.cn/simple/ 清华大学
```
