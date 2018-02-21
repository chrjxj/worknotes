

# 查询cv2的编译信息  
```
python -c "import cv2; print(cv2.getBuildInformation())"  

General configuration for OpenCV 2.4.13.2 =====================================

  Platform:
    Host:                        Windows 10.0.14393 AMD64
    CMake:                       3.6.3
    CMake generator:             Visual Studio 9 2008 Win64
    CMake build tool:            C:/Program Files (x86)/Microsoft Visual Studio 9.0/Common7/IDE/devenv.com
    MSVC:                        1500

  C/C++:
    Built as dynamic libs?:      YES
    C++ Compiler:                C:/Program Files (x86)/Microsoft Visual Studio 9.0/VC/bin/x86_amd64/cl.exe  (ver 15.0.30729.1)
    C++ flags (Release):         /DWIN32 /D_WINDOWS /W4 /GR /EHa  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bi                                        gobj /Oi  /wd4127 /wd4251 /wd4275 /wd4589 /wd4359 /MD /O2 /Ob2 /DNDEBUG  /Zi
    C++ flags (Debug):           /DWIN32 /D_WINDOWS /W4 /GR /EHa  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bi                                        gobj /Oi  /wd4127 /wd4251 /wd4275 /wd4589 /wd4359 /D_DEBUG /MDd /Zi /Ob0 /Od /RTC1
    C Compiler:                  C:/Program Files (x86)/Microsoft Visual Studio 9.0/VC/bin/x86_amd64/cl.exe
    C flags (Release):           /DWIN32 /D_WINDOWS /W3  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bigobj /Oi                                          /MD /O2 /Ob2 /DNDEBUG  /Zi
    C flags (Debug):             /DWIN32 /D_WINDOWS /W3  /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D _SCL_SECURE_NO_WARNINGS /Gy /bigobj /Oi                                          /D_DEBUG /MDd /Zi /Ob0 /Od /RTC1
    Linker flags (Release):      /machine:x64  /INCREMENTAL:NO  /debug
    Linker flags (Debug):        /machine:x64  /debug /INCREMENTAL:YES
    ccache:                      NO
    Precompiled headers:         YES

  OpenCV modules:
    To be built:                 core flann imgproc highgui features2d calib3d ml video legacy objdetect photo gpu nonfree contrib python stitching superres                                         ts videostab
    Disabled:                    world
    Disabled by dependency:      -
    Unavailable:                 androidcamera dynamicuda java ocl viz

  Windows RT support:            NO

  GUI:
    QT:                          NO
    Win32 UI:                    YES
    OpenGL support:              YES (glu32 opengl32)
    VTK support:                 NO

  Media I/O:
    ZLib:                        build (ver 1.2.7)
    JPEG:                        build (ver 62)
    PNG:                         build (ver 1.5.27)
    TIFF:                        build (ver 42 - 4.0.2)
    JPEG 2000:                   build (ver 1.900.1)
    OpenEXR:                     build (ver 1.7.1)

  Video I/O:
    Video for Windows:           YES
    DC1394 1.x:                  NO
    DC1394 2.x:                  NO
    FFMPEG:                      YES (prebuilt binaries)
      avcodec:                   YES (ver 55.18.102)
      avformat:                  YES (ver 55.12.100)
      avutil:                    YES (ver 52.38.100)
      swscale:                   YES (ver 2.3.100)
      avresample:                YES (ver 1.0.1)
    OpenNI:                      NO
    OpenNI PrimeSensor Modules:  NO
    PvAPI:                       NO
    GigEVisionSDK:               NO
    DirectShow:                  YES
    Media Foundation:            NO
    XIMEA:                       NO
    Intel PerC:                  NO

  Other third-party libraries:
    Use IPP:                     8.1.1 [8.1.1]
         at:                     C:/Program Files (x86)/intel/Composer XE 2013 SP1/ipp
    Use Eigen:                   NO
    Use TBB:                     YES (ver 4.2 interface 7005)
    Use OpenMP:                  NO
    Use GCD                      NO
    Use Concurrency              NO
    Use C=:                      NO
    Use Cuda:                    NO
    Use OpenCL:                  NO

  Python:
    Interpreter:                 X:/Python27-x64/python.exe (ver 2.7.13)
    Libraries:                   X:/Python27-x64/libs/python27.lib (ver 2.7.13)
    numpy:                       X:/Python27-x64/lib/site-packages/numpy/core/include (ver 1.11.3)
    packages path:               X:/Python27-x64/Lib/site-packages

  Java:
    ant:                         NO
    JNI:                         NO
    Java tests:                  NO

  Documentation:
    Build Documentation:         NO
    Sphinx:                      NO
    PdfLaTeX compiler:           C:/Program Files (x86)/MiKTeX 2.9/miktex/bin/pdflatex.exe
    Doxygen:                     NO

  Tests and samples:
    Tests:                       YES
    Performance tests:           YES
    C/C++ Examples:              NO

  Install path:                  D:/Build/OpenCV/opencv-2.4.13.2-vc9-x64/install

  cvconfig.h is in:              D:/Build/OpenCV/opencv-2.4.13.2-vc9-x64
-----------------------------------------------------------------
```

# 如果没有把FFMPEG编译进去，就无法读取摄像头视频



---

 
# 编译安装opencv 2.4.13    

https://stackoverflow.com/questions/40128751/how-to-install-opencv-2-4-13-for-python-2-7-on-ubuntu-16-04  
部分库的版本有修改，14.04和16.04稍微有区别，具体查看这个帖子  

```
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential -y
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y

sudo apt-get install python3-numpy python3-pip python3-scipy python3-matplotlib python-dev python-matplotlib python-numpy python-scipy -y

sudo apt-get install python-pip python-tk libqt4-dev libqt4-opengl-dev  libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant -y


echo "GUI and openGL extensions"
sudo apt-get install qt4-default libqt4-opengl-dev libvtk5-qt4-dev libgtk2.0-dev libgtkglext1 libgtkglext1-dev -y

echo "image manipulation libraries"
sudo apt-get install libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev -y
sudo apt-get install libjpeg-dev libjpeg9 libjpeg9-dbg libjpeg-progs libtiff5-dev libtiff5 libtiffxx5 libtiff-tools libjasper-dev libjasper1  libjasper-runtime zlib1g zlib1g-dbg zlib1g-dev -y

echo "video manipulation libraries"
sudo apt-get install libavformat-dev libavutil-ffmpeg54 libavutil-dev libxine2-dev libxine2 libswscale-dev libswscale-ffmpeg3 libdc1394-22 libdc1394-22-dev libdc1394-utils -y

echo "codecs"
sudo apt-get install libavcodec-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install libtheora-dev libvorbis-dev libxvidcore-dev -y
sudo apt-get install ffmpeg x264 libx264-dev -y
sudo apt-get install libv4l-0 libv4l v4l-utils -y

echo "multiproccessing library"
sudo apt-get install libtbb-dev -y

echo "finally download and install opencv"
mkdir opencv
cd opencv
wget "https://github.com/Itseez/opencv/archive/2.4.13.zip"
unzip opencv-2.4.13.zip

cd opencv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE \
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
 -DWITH_VTK=ON ..

echo "making and installing"
make -j8
sudo make install

echo "finishing off installation"
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "Congratulations! You have just installed OpenCV. And that's all, folks! :P"
```  

 


# 将编译好的opencv2.4.13装到虚拟环境中
- 先在实际环境中编译安装好opencv
- 再进行下面操作  

```
virtualenv virtopencv
cd virtopencv
cp /usr/local/lib/python2.7/dist-packages/cv* ./lib/python2.7/site-packages/
./bin/pip install numpy
source bin/activate
python
import cv
```  
------------

# 编译FFMPEG # 
```
https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#ffmpeg  
```  
  ---------

  
# 参考：其他版本的python和opencv
```
http://www.itgo.me/a/7400149048751409304/python-opencv-
http://answers.opencv.org/question/113185/rtsp-communication-problem/
https://stackoverflow.com/questions/20891936/rtsp-stream-and-opencv-python  
```

