## Author: Juan Maroñas Molano
## Example on how to install keras using conda in an enviroment

conda=/usr/local/anaconda3/bin/conda
activate=/usr/local/anaconda3/bin/activate
deactivate=/usr/local/anaconda3/bin/deactivate

$conda create -y --no-default-packages --prefix /usr/local/keras/python3.5/lastversion python=3.5
source $activate /usr/local/keras/python3.5/lastversion
pip install  keras
pip install pandas
source $deactivate
