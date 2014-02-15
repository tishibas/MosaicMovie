#!/bin/bash

mkdir dev
cd dev
yum install -y gcc gcc-c++
git clone --depth 1 git://git.videolan.org/x264
wget http://www.cmake.org/files/v2.8/cmake-2.8.12.2.tar.gz
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz 
wget http://www.ffmpeg.org/releases/ffmpeg-2.1.3.tar.bz2
wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.8/opencv-2.4.8.zip/download


unzip download
tar zxvf cmake-2.8.12.2.tar.gz
tar zxvf yasm-1.2.0.tar.gz
tar jxvf ffmpeg-2.1.3.tar.bz2

cd x264
./configure --enable-shared --enable-pic
make
make install

cd ../cmake-2.8.12.2
./bootstrap
make
make install

cd ../yasm-1.2.0.tar.gz
./configure
make
make install

cd ../ffmpeg-2.1.3
./configure --enable-gpl --enable-libx264 --enable-nonfree --enable-shared
make
make install

echo 'export LD_LIBRARY_PATH=/usr/local/lib' >> ~/.bashrc
echo 'export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig' >> ~/.bashrc

source ~/.bashrc

cd ../opencv-2.4.8
mkdir build
cd build
cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=RELEASE -DWITH_GTK=ON -DWITH_FFMPEG=ON 
make
make install