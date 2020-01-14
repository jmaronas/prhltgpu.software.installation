## Author: Juan Maroñas Molano
## Example on how to install srilm.  NOT UPDATED ANYMORE!!
## This just works for the specific srilm version provided in the software repository. New versions of srilm must not work under the flow of this script.

cd ./srilm
mv  srilm-1.7.2.tar.gz srilm.tgz
./install_srilm.sh
mv srilm /usr/local/
rm env.sh


