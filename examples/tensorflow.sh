## Author: Juan Maroñas Molano
## Example on how to install tensorflow using conda in an enviroment

conda=/usr/local/anaconda3/bin/conda
activate=/usr/local/anaconda3/bin/activate
deactivate=/usr/local/anaconda3/bin/deactivate

$conda create -y --no-default-packages --prefix /usr/local/tensorflow/python3.5/1.13.1 python=3.5
source $activate /usr/local/tensorflow/python3.5/1.13.1
pip install tensorflow-gpu==1.13.1
source $deactivate
