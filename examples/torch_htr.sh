## Author: Juan Maroñas Molano
## Example on how to install torch for gpu with Joan's package: Laia. NOT UPDATED ANYMORE!!
# I provide and example in cuda 8 and 9 as by the time of installing torch there was a bug solved in this way. Hope this is enough by the time you use this script. I think that Laia has a dependency that only allows to use cudnn5. This means that it will probably not compile against newer versions of cuda anymore.
## This installation file was checked on May 2018

#cuda 8 
rm /usr/local/cuda
ln -s /usr/local/cuda-8.0/ /usr/local/cuda

git clone https://github.com/torch/distro.git /usr/local/torch/cuda8_torch_htr/ --recursive
cd /usr/local/torch/cuda8_torch_htr/

./install-deps
./install.sh
./install/bin/luarocks install cunn
./install/bin/luarocks install cudnn

/usr/local/torch/cuda8_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/baidu-research/warp-ctc/master/torch_binding/rocks/warp-ctc-scm-1.rockspec
/usr/local/torch/cuda8_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/jpuigcerver/imgdistort/master/torch/imgdistort-scm-1.rockspec
/usr/local/torch/cuda8_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/jpuigcerver/Laia/master/rocks/laia-scm-1.rockspec

#cuda 9.1 
rm /usr/local/cuda
ln -s /usr/local/cuda-9.1/ /usr/local/cuda
export TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__"

git clone https://github.com/torch/distro.git /usr/local/torch/cuda9.1_torch_htr/ --recursive
cd /usr/local/torch/cuda9.1_torch_htr/

./install-deps
./install.sh
./install/bin/luarocks install cunn
./install/bin/luarocks install cudnn

/usr/local/torch/cuda9.1_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/baidu-research/warp-ctc/master/torch_binding/rocks/warp-ctc-scm-1.rockspec
/usr/local/torch/cuda9.1_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/jpuigcerver/imgdistort/master/torch/imgdistort-scm-1.rockspec
/usr/local/torch/cuda9.1_torch_htr/install/bin/luarocks install https://raw.githubusercontent.com/jpuigcerver/Laia/master/rocks/laia-scm-1.rockspec

