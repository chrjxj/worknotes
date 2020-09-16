# Setup Python #


## Python Virtualenv

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


## Anaconda


#### General Setup


Anaconda 安装包可以到 https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/ 下载。

```
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.2.0-Linux-x86_64.sh
chmod +x Anaconda3-5.2.0-Linux-x86_64.sh
./Anaconda3-5.2.0-Linux-x86_64.sh
```

Check env in ```.bashrc```

```

```

TUNA 还提供了 Anaconda 仓库的镜像，运行以下命令:

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

- 安装Tensorflow: ```conda install tensorflow-gpu==1.7```
- 安装keras: ```conda install keras-gpu```


## Use conda to manage virtual env

reference links:

* https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html?highlight=environment 
* https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/
* https://conda.io/docs/user-guide/tasks/manage-environments.html
* example commands:
    
    ```
    conda create -n yourenvname python=x.x anaconda
    
    source activate yourenvname
    
    conda install -n yourenvname [package]
    conda install --file requirements. txt    
    
    source deactivate
    
    conda remove -n yourenvname -all
    ```



To create an environment with a specific version of Python and multiple packages:
`conda create -n myenv python=3.4 scipy=0.15.0 astroid babel`

conda activate and conda deactivate only work on conda 4.6 and later versions.


- Create the environment from the environment.yml file: `conda env create -f environment.yml`
- Activate the new environment: `conda activate myenv`
- Verify that the new environment was installed correctly: `conda list`
- Cloning an environment: `conda create --name myclone --clone myenv`
- To activate an environment: `conda activate myenv`; To deactivate an environment: `conda deactivate`
- To see a list of all of your environments: `conda env list`
- If the environment is not activated: `conda list -n myenv`
- If the environment is activated: `conda list`
- To remove an environment: `conda remove --name myenv --all`




## Mirrors


#### Python (conda/pip)

创建打开 pip 源配置文件 ```mkdir ~/.pip && touch ~/.pip/pip.conf && vim ~/.pip/pip.conf```

```
[global]
trusted-host = mirrors.aliyun.com
index-url = http://mirrors.aliyun.com/pypi/simple/
```

#### 手动指定源

可以在pip后面跟-i 来指定源

```
pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple 

pip install \
  -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
  https://mirrors.tuna.tsinghua.edu.cn/tensorflow/linux/gpu/tensorflow_gpu-1.4.0-cp36-cp36m-linux_x86_64.whl
```

conda 添加源

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```


#### 国内一些镜像站点

pipy国内镜像
```
http://mirrors.aliyun.com/pypi/simple/ 阿里云
http://pypi.mirrors.ustc.edu.cn/ 中国科学技术大学
https://pypi.tuna.tsinghua.edu.cn/simple/ 清华大学
```
