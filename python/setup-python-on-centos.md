# Setup Python on CentOS


#### CentOS 7.5 安装 Python3.7

```
sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz


tar -zxvf Python-3.7.0.tgz

cd Python-3.7.0 #进入解压后的目录，依次执行下面命令进行手动编译
./configure prefix=/usr/local/python3 
make -j4 && sudo make install

#添加python3的软链接 
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3.7 
#添加 pip3 的软链接 
ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3.7
#测试是否安装成功了
python3.7 -V
```

reference: 
- https://www.jianshu.com/p/a67527356807
- https://segmentfault.com/a/1190000015628625

#### 升级Python到2.7.15

- centos 7 自带的 python2 是 python2.7.5；可能需要升级
- 步骤如下

https://www.jianshu.com/p/29cdf7629eef
