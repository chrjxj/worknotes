#!/bin/bash

sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    imagemagick \
    libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    python-tk \
    libqt4-dev libqt4-opengl-dev  libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common texlive-latex-extra libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev ant \
    qt4-default libvtk5-qt4-dev libgtk2.0-dev libgtkglext1 libgtkglext1-dev \
    libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev \
    libjpeg-dev libjpeg9 libjpeg9-dbg libjpeg-progs libtiff5-dev libtiff5 libtiffxx5 libtiff-tools libjasper-dev libjasper1  libjasper-runtime zlib1g zlib1g-dbg zlib1g-dev \
    libavformat-dev libavutil-ffmpeg54 libavutil-dev libxine2-dev libxine2 libswscale-dev libswscale-ffmpeg3 libdc1394-22 libdc1394-22-dev libdc1394-utils \
    libavcodec-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev \
    ffmpeg x264 \
    libtbb-dev

cd /tmp/ && mkdir opencv && cd opencv && wget "https://github.com/SnowSense/archive/raw/master/linux/opencv-2.4.13.zip" && unzip opencv-2.4.13.zip && \
    cd opencv-2.4.13 && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=RELEASE \
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
    make -j"$(nproc)" && sudo make install && sudo echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf && sudo ldconfig && rm -rf /tmp/opencv-2.4.13.zip /tmp/opencv-2.4.13/

