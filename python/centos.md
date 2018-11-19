


#### 升级Python到2.7.15

- centos 7 自带的 python2 是 python2.7.5；可能需要升级
- 步骤如下

```
yum groupinstall -y "Development tools"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel
cd /tmp
wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz
tar zxf Python-2.7.15.tgz
cd Python-2.7.15
./configure
make && make install
```
