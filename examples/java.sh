## Author: Juan Maroñas Molano
## Example on how to install java.  NOT UPDATED ANYMORE!!
## This just works for the specific java version provided in the software repository. New versions of java must not work under the flow of this script.

cd ./java/
mkdir /usr/local/java/
cp jre-8u161-linux-x64.tar.gz /usr/local/java/
cd /usr/local/java/
tar -xvzf jre-8u161-linux-x64.tar.gz
rm jre-8u161-linux-x64.tar.gz

