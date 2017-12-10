# Setup Ubuntu #

skip basic installation steps.

## 安装常用软件

```
sudo apt-get install python-pip python-dev python3-pip python3-dev python-virtualenv vnc4server vim git wget unrar gvim-qt screen
sudo apt-get install filezilla filezilla-locales

echo 'Install shadowsocks'
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5

echo 'Sublime Text 3'
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update; sudo apt install atom
```

## Setup SS client
Great [setup reference](https://jingsam.github.io/2016/05/08/setup-shadowsocks-http-proxy-on-ubuntu-server.html)

install:

```
sudo apt-get install python python-pip && sudo pip install shadowsocks && sudo mkdir /etc/shadowsocks && sudo touch /etc/shadowsocks/config.json
sudo apt-get install polipo
```

Setup
```
sudo vim /etc/shadowsocks/config.json
{
  "server": "{your-server}",
  "server_port": 40002,
  "local_port": 1080,
  "password": "{your-password}",
  "timeout": 600,
  "method": "aes-256-cfb"
}

sudo vim /etc/polipo/config

logSyslog = true
logFile = /var/log/polipo/polipo.log
proxyAddress = "0.0.0.0"
socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5
chunkHighMark = 50331648
objectHighMark = 16384
serverMaxSlots = 64
serverSlots = 16
serverSlots1 = 32

sudo /etc/init.d/polipo restart && sudo sslocal -c /etc/shadowsocks/config.json -d start && export http_proxy="http://127.0.0.1:8123/"
```

## Install Ubuntu desktop

- Install Ubuntu desktop ```sudo apt-get install ubuntu-desktop```
- Gnome 3 installation: ```sudo apt-get install gnome-shell```
- KDE see Kubuntu installation: ```sudo apt-get install kubuntu-desktop```
- XFCE installation: ```sudo apt-get install xfce4```
- LXDE installation: ```sudo apt-get install lxde```
- Gnome Classic a Gnome 3 desktop that looks like Gnome 2 installation: ```sudo apt-get install gnome-session-fallback```


## 安装新硬盘

```
sudo fdisk -l
# use 'n' - new; use 'p' - display
sudo fdisk
sudo mkfs -t ext4 /dev/sda1
# add this to /etc/rc.local
sudo mount /dev/sda1 /data/v2
```


#### apt and apt-get

```
apt list --installed
apt-cache search package    #搜索包（相当于yum list | grep pkg）
apt-cache show package      #显示包的相关信息，如说明、大小、版本等
apt-cache showpg package    #显示包的相关信息，如Reverse Depends（反向依赖）、依赖等
apt-get install package       #安装包
apt-get reinstall package     #重新安装包
apt-get -f install package    #强制安装
apt-get remove package        #删除包（只是删掉数据和可执行文件，不删除配置文件）
apt-get remove --purge package       #删除包，包括删除配置文件等
apt-get autoremove --purge package   #删除包及其依赖的软件包+配置文件等
apt-get update          #更新源
apt-get upgrade         #更新已安装的包
apt-get dist-upgrade    #升级系统
apt-get dselect-upgrade        #使用 dselect 升级
apt-cache depends package      #了解使用依赖
apt-cache rdepends package     #查看该包被哪些包依赖
apt-get build-dep package   #安装相关的编译环境
apt-get source package      #下载该包的源代码
apt-get clean && apt-get autoclean  #清理下载文件的存档 && 只清理过时的包
apt-get check             #检查是否有损坏的依赖
dpkg -S filename          #查找filename属于哪个软件包
apt-file search filename  #查找filename属于哪个软件包
apt-file list packagename #列出软件包的内容
apt-file update           #更新apt-file的数据库
```
