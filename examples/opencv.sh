## Author: Juan Maroñas Molano
## Example on how to install opencv. NOT UPDATE ANYMORE
## This installation file was checked on January 2020

INSTALL_DIR=$HOME"/opencv/"
cd /tmp/
git clone https://github.com/opencv/opencv.git 
cd opencv && git checkout 3.3.1 && cd .. 
git clone https://github.com/opencv/opencv_contrib.git && cd opencv_contrib && git checkout 3.3.1 && cd .. 
cd opencv && mkdir build && cd build 
cmake -DBUILD_opencv_cudacodec=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$INSTALL_DIR -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D BUILD_EXAMPLES=ON .. 
sudo make -j$(nproc) && sudo make install && rm -r opencv*

