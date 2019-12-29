# Ubuntu 16.04 


protocol buffers    JSON

Bazel  make/cmake/gradle
gRPC   HTTP/REST



## protocol buffers

### 安装 protocol compiler (protoc)


1. install pre-build binaries

- go to `https://github.com/protocolbuffers/protobuf/releases`
- download, unzip and copy to `/usr/bin` and `/usr/include`

```
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.1/protoc-3.9.1-linux-x86_64.zip
unzip protoc-3.9.1-linux-x86_64.zip
sudo cp -rf bin/protoc /usr/bin/protoc
sudo cp -rf include/google/protobuf /usr/include/google/protobuf
```


2. install from source

https://github.com/protocolbuffers/protobuf/blob/master/src/README.md


```

sudo apt-get install autoconf automake libtool curl make g++ unzip
git clone https://github.com/google/protobuf.git
cd protobuf
git submodule update --init --recursive
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig # refresh shared library cache.

protoc --version


```


```
可能遇到问题

很有可能，执行过程中会出现以下错误提示：

./autogen.sh: 4: ./autogen.sh: autoreconf: not found

解决办法：执行以下命令即可

sudo apt-get install autoconf
sudo apt-get install automake
sudo apt-get install libtool
```
### use protocol compiler (protoc)





## Installing Bazel on Ubuntu 

- https://docs.bazel.build/versions/0.19.1/install-ubuntu.html


