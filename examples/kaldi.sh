## Author: Juan Maroñas Molano
## Example on how to install kaldi for gpu. NOT UPDATED ANYMORE!!
## This installation file was checked on September 2018

rm /usr/local/cuda
ln -s /usr/local/cuda-10.0/ /usr/local/cuda

git clone https://github.com/kaldi-asr/kaldi.git /usr/local/kaldi/cuda10_kaldi --origin upstream
cd /usr/local/kaldi/cuda10_kaldi/
cd ./tools/extras/
./check_dependencies.sh

read  -r -p "Press any key if continue after checking kaldi check dependencies. If any missing you have to install it." key
cd ..
make -j 2
cd ../src/

./configure --shared
make depend -j 2
make -j 2
