## Author: Juan Maroñas Molano
## Example on how to install pytorch using conda in an enviroment

conda=/usr/local/anaconda3/bin/conda
activate=/usr/local/anaconda3/bin/activate
deactivate=/usr/local/anaconda3/bin/deactivate

$conda create -y --no-default-packages --prefix /usr/local/pytorch/python3.7/cuda10.0_pytorch_1.0.0 python=3.7
source $activate  /usr/local/pytorch/python3.7/cuda10.0_pytorch_1.0.0
$conda install -y pytorch=1.0.0 torchvision cuda100 -c pytorch
source $deactivate


