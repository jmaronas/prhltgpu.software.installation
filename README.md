# SOFTWARE INSTALLATION FOR MACHINE LEARNING
**Author**: Juan Maroñas Molano (jmaronasm@gmail.com) (jmaronas@prhlt.upv.es)

**Date**: 14-01-2020

This is a file describing the repository of installation of the prhltgpus. This is a new repository, building from the previous one, in order to lighten it by removing previous versions of cuda, drivers and so on... This way of working with the PRHLTGPUS started on 2 March 2017.

The installation is based on providing support on python3.x and cuda10 and above. We further do not provide installation of softwares as kaldi or torch, but a guide of installation is provided in the Github. For a description of the software installed and the user accounts please see the documentation file.

If you want to install the software, I recommend always log in into the sudo user, i.e type ```sudo su``` and then run the files.

If you wish to have access to the repository (named **software repository**) containing all the files and installation scripts, please send an email to maquinas.prhlt@gmail.com. In this actual repository you will only find the guide of installation, plus specific ways of installing different usefull softwares for deep learning. If you wish to add an example on how to install any toolkit, make a pull request.

## Software Repository Description

* **drivers**: Contains the drivers. 
*  **cuda**: Contains cuda installation files
*  **cudnn**: Contains cudnn installation files
*  **prhltgpu.software.installation/examples**: Examples on how to install different software. Note that this folder is this one provided in the public repository.
*  **java**:  A java version used by the examples. It is not the last release!!
*  **srilm**:  A srilm version used by the examples. It is not the last release!!
* **install**. Contains installation files, updates and some utils.

#### Examples

In the examples folder you can find  how you can install different softwares for deeplearning withing the PRHLTGPU software configuration. This softwares include:

* pytorch
* tensorflow
* keras
* srilm
* torch with cuda
* torch with laia and cuda
* kaldi with gpu
* java

**Note:** If you wish to provide examples of other softwares within our framework make a pull request.  This could be the case of **PyLaia**, **P2PALA** and **EDDL**.


## Linux Installation

Machines work with ubuntu 16 LTS (we will be doing an update soon). When installing we can find several options:
	
1. Only one hard drive
2. Two hard drives, one is SSD and the other is an HDD
3. More than two hard drives being one and SSD
4. Two hard drives and above being all of them HDD

For options 1 and 4 install Ubuntu normally.  For 2 and 3, the partition table must be done in the following way:

### Bios is in UEFI mode:

In the SSD drive install the following partitions:

* swap: with size at least half of the computer RAM.
* efi: 500 MB
* / : the rest of the memory available

In (at least one of) the HDD drive:
* /home : all the memory

### Bios in BIOS mode:
In the SSD drive install the following partitions:

* swap: with size at least half of the computer RAM.
* boot: 1000 MB
* / : the rest of the memory available

In (at least one of) the HDD drive:
* /home : all the memory

**Note:**  If the computer has more than one HDD drive, this could be use as a /data partition. This is not implemented yet.

## Installation process.

Before running any command, please type the following on the console:

```sudo visudo```

and at the end of the file paste the following:

```prhlt ALL=(ALL) NOPASSWD:ALL```

Also execute the following:

``` sudo apt-get install dsh git```

Then, clone the Software Repository in your ```/home/``` and run ```sudo su```

After this you are ready to install. As some softwared require you to provide some installation directory and currently I am lazy to see how can we automatically set this to each of them, on each machine you have to log in and then run the files. There is no way to do it with ``dsh``.

Then you to run the files in the following sequence:

1. run ```install.sh```
2. run ```update_date.sh``` files

where ```date``` is the date when the update was done. This files must be running in order. This is very important. For instance, a correct  sequence is:
* ```./install.sh```
* ```./update_21032019.sh```
*  ```./update_21032020.sh```

An **incorrect** sequence could be:

* ```./install.sh```
* ```./update_21032020.sh```
* ```./update_21032019.sh```


## Some Advices

Things that you might find usefull. They are not necessary :

### Disable nouveau drivers

You might need to disable nouveau drivers after nvidia-drivers installation. To do this:

```
#disable drivers nouveau
sudo vi /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
sudo update-initramfs -u
sudo reboot
```

### Disable secure boot

Disable secure boot in the bios is important for remote managment. This is because if not drivers must be signed/trusted in order to be loaded by the kernel.

### How to mount a new device
I will add how to mount another HDD as a data partition

### Wake up online
How to wake up your computer from remote. Two options are here. When the computer has been shut down, and when the computer has been shutdown and the current has been cut (for instance if you plug off the power-supply wire). This is configured in bios plus a script

### Configure daemon
How to configure a daemon that monitor, for instance, the temperature of several machines.

## Management Utils

I also provide some utils I use to manage the machines. This is based on the use of ```dsh```command. This files can be found in ```./utils/```.  Previous to run the files you must create a file named ```gpu_machines.lst```. This file must contain the full ip direction of the machine you want to connect to. See file ```gpu_machines.lst```  provided in the repository (the ips are invented). 

Also you must configure the ssh public and private keys from host and remote machine so that no password is required when log into a specific machine.  A guide is provided [here.](https://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id/)

Different functionalities are provided:

* ```get_unique_users_in_machines.sh```: By running this file you get all the users that have, at least, one account in the machines. 
* ```check_disk_space_of_user_per_gpu.sh```: By running this file you get the amount of disk memory of each user in each GPU.
* ```check_failed_GPU_drivers.sh```: By running this file you get which drivers are not properly installed in the machines.
* ```check_users_per_gpu.sh``` By running this file you get the users in each GPU.
* ```check_gpus_per_user_scriptNUMBER.sh```. This script is divided in two scripts. You run only once the script where NUMBER=1. Then, to check for each specific user, you run the script where NUMBER=2 plus the name of the user you want to check. This will return the gpus ID assigned to that user. For instance.
	 ```./check_gpus_per_user_script1.sh```
	 ```./check_gpus_per_user_script2.sh jmaronasm```
	 ```./check_gpus_per_user_script2.sh rparedes```
	 ```./check_gpus_per_user_script2.sh maparla```
* ```filter_users_by_time.py: ```Before running this file you must run ```check_users_per_gpu.sh```. This file is used to check for accounts that has not been used during a period of time. You must open the file and specify the current month and year, and the period of time (in number of months). The file returns the user and the GPU in which there is an account not used during the specified period of time.

## Acknowledgment

I will like to acknowledge the support of Lorenzo Quiros, Mario Parreño, Jose Prieto and Miguel Dominguez in  many aspects of the PRHLTGPU managment. 




