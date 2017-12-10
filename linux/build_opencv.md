# Build OpenCV in Ubuntu 16

### 查询cv2的编译信息
```
python -c "import cv2; print(cv2.getBuildInformation())"  
```

### 编译opencv

部分库的版本有修改，14.04和16.04稍微有区别，具体查看这个帖子: https://stackoverflow.com/questions/40128751/how-to-install-opencv-2-4-13-for-python-2-7-on-ubuntu-16-04  

```

sudo apt-get update && \
  sudo apt-get install -y --no-install-recommends build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python3-numpy python3-pip python3-scipy python3-matplotlib python-dev python-matplotlib python-numpy python-scipy && \
  sudo apt-get install python-pip python-tk libqt4-dev libqt4-opengl-dev  libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant -y && \
  echo "GUI and openGL extensions" && \
  sudo apt-get install qt4-default libqt4-opengl-dev libvtk5-qt4-dev libgtk2.0-dev libgtkglext1 libgtkglext1-dev -y && \
  echo "image manipulation libraries" && \
  sudo apt-get install libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev libjpeg-dev libjpeg9 libjpeg9-dbg libjpeg-progs libtiff5-dev libtiff5 libtiffxx5 libtiff-tools libjasper-dev libjasper1  libjasper-runtime zlib1g zlib1g-dbg zlib1g-dev -y  && \
  echo "video manipulation libraries"  && \
  sudo apt-get install libavformat-dev libavutil-ffmpeg54 libavutil-dev libxine2-dev libxine2 libswscale-dev libswscale-ffmpeg3 libdc1394-22 libdc1394-22-dev libdc1394-utils -y   && \
  echo "Install codecs and ffmpeg"   && \
  sudo apt-get install libavcodec-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev ffmpeg x264 libx264-dev libv4l-0 libv4l v4l-utils   && \
  echo "multiproccessing library"   && \
  sudo apt-get install libtbb-dev -y

echo "finally download and install opencv" && \
  mkdir opencv && cd opencv && wget "https://github.com/Itseez/opencv/archive/2.4.13.zip" && unzip 2.4.13.zip

&& cd opencv-2.4.13 && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=RELEASE \
 -DCMAKE_INSTALL_PREFIX=/usr/local \
 -DINSTALL_C_EXAMPLES=ON \
 -DINSTALL_PYTHON_EXAMPLES=ON \
 -DBUILD_EXAMPLES=ON \
 -DBUILD_opencv_cvv=OFF \
 -DBUILD_NEW_PYTHON_SUPPORT=ON \
 -DWITH_TBB=ON \
 -DWITH_V4L=ON \
 -DWITH_QT=ON \
 -DWITH_OPENGL=ON \
 -DCMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs \
 -DWITH_VTK=ON .. && \
make -j"$(nproc)" && sudo make install && \
echo "finishing off installation" && sudo echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf && sudo ldconfig
```  

### Mannually install opencv2.4.13 libs to python environment

- 先在实际环境中编译安装好opencv

- 如果需要将opencv 库文件"安装"到虚拟环境中:

```
virtualenv opencv && cd virtopencv

cp /usr/local/lib/python2.7/dist-packages/cv* ./lib/python2.7/site-packages/
./bin/pip install numpy
source bin/activate
python
import cv
```


#### Q&A    
```
Q： [rtsp @ 0x302dc20] Nonmatching transport in server reply

A： 修改cap_ffmpeg_impl.hpp：
av_dict_set(&dict, "rtsp_transport", "tcp", 0);
改为：
av_dict_set(&dict, "rtsp_transport", "udp", 0);
```

## 编译FFMPEG ##

https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#ffmpeg  
