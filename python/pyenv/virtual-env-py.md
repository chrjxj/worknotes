# Setup Python Virtualenv #


## General Setup

Install python-virtualenv
```
# install python 2.7 and 3
sudo apt-get install -y python-pip python3-pip python-virtualenv
```

Create python virtualenv

```
virtualenv ~/pyenv/Web --python=python3.5
# active ENV
source ~/pyenv/Web/bin/activate
```

After source activate, install python packages for virtualenv

```
# for python2
which pip
pip install ipython==5.0
pip install -r requirements.txt
```

```
# for python3
which pip3
pip3 install ipython
pip3 install -r requirements.txt
```
