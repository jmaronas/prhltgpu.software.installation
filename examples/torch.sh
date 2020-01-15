## Author: Juan Maroñas Molano
## Example on how to install torch for gpu. NOT UPDATED ANYMORE!!
# I provide and example in cuda 8 and 9 as by the time of installing torch there was a bug solved in this way. Hope this is enough by the time you use this script.
## This installation file was checked on May 2018


#cuda8
rm /usr/local/cuda
ln -s /usr/local/cuda-8.0/ /usr/local/cuda

git clone https://github.com/torch/distro.git /usr/local/torch/cuda8_torch/ --recursive
cd /usr/local/torch/cuda8_torch/

./install-deps
./install.sh
./install/bin/luarocks install cunn
./install/bin/luarocks install cudnn


#cuda9
rm /usr/local/cuda
ln -s /usr/local/cuda-9.1/ /usr/local/cuda
export TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__"

git clone https://github.com/torch/distro.git /usr/local/torch/cuda9.1_torch/ --recursive
cd /usr/local/torch/cuda9.1_torch/

./install-deps
./install.sh
./install/bin/luarocks install cunn
./install/bin/luarocks install cudnn



