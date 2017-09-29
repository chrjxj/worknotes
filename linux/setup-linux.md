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

## Install Ubuntu desktop

- Install Ubuntu desktop ```sudo apt-get install ubuntu-desktop```
- Gnome 3 installation: ```sudo apt-get install gnome-shell```
- KDE see Kubuntu installation: ```sudo apt-get install kubuntu-desktop```
- XFCE installation: ```sudo apt-get install xfce4```
- LXDE installation: ```sudo apt-get install lxde```
- Gnome Classic a Gnome 3 desktop that looks like Gnome 2 installation: ```sudo apt-get install gnome-session-fallback```
