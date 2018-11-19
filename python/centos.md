


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


```
mv /usr/bin/python /usr/bin/python.old
rm -f /usr/bin/python-config
ln -s /usr/local/bin/python /usr/bin/python && ln -s /usr/local/bin/python-config /usr/bin/python-config && ln -s /usr/local/include/python2.7/ /usr/include/python2.7


python --version

```

```
wget https://bootstrap.pypa.io/ez_setup.py -O - | python
easy_install pip
```
