# SOFTWARE INSTALLATION FOR MACHINE LEARNING

**TL:DR**: In this repository I provide tools to install several software for machine learning (different versions of cuda and cudnn, pytorch, tensorflow and so on). I also provide tools to manage several machines with different users.  Moreover I provide some advice on linux installation. 

**Author**: Juan Maroñas Molano (jmaronasm@gmail.com) (jmaronas@prhlt.upv.es) (maquinas.prhlt@gmail.com)

**Date**: 12-06-2020

This is a file describing the repository of installation of the PRHLTGPUs. This is a new repository, building up from the previous one. I have basically erase some unuseful files in order to lighten the repository. This way of working with the PRHLTGPUS started on 2nd March 2018.

The repository has been partially uploaded to Github. Here I only upload the README file explaining how things are done and some software installation examples, within the current installation framework.  If you wish to have access to all the necessary files (software and installation scripts), please send me an email.  If you wish to add an example on how to install any toolkit, within the current installation framework, make a pull request. 

Up to this moment, I used to install many machine learning softwares to be used by all the users (such as Kaldi). However, this is time consuming if we take into account how much of this software is then used. For that reason, I just now provide  support for python3.x, cuda>10 , cudnn, linux libraries and some more things. For a description on the software installed by using this repository, please see the pdf file [here](https://github.com/jmaronas/prhltgpu.software.installation/blob/master/maquinas_prhlt_version_github.pdf). For examples on how to install typicall machine learning toolkits, please see section **2.1 EXAMPLES** in this README file.

For the PRHLT members, the rest of information: accounts distribution and so on can be found in the intranet as always.



## Software Repository Description
If you request the repository, you will  find the next folders:

* **drivers**: Contains the drivers. 
* **install**. Contains installation files. This files will install all the computing framework. 
* **utils** Contain some utilities to manage several gpus at the same time. Go to section **Management Utils** for further information
* **install_repository.sh**: Downloads the necessary files for installation, such as cuda installation files.

# Installation Process

This is the installation process you can follow in order to set up your machines. By following this set of instructions you will find a way of installing a bunch of machines just by using a single computer (which I will refer to by the *host machine*), i.e the machines are installed remotely.

## 1. Linux Installation

On each of the different machines you first have to install linux. To use the current set of files you must install the last ubuntu 16 LTS release (this will be updated soon to ubuntu 18). In a linux machine you can find several options:


1. Only one hard drive
2. Two hard drives, one is SSD and the other is an HDD
3. More than two hard drives being one and SSD
4. At least two hard drives being all of them HDD

For options 1 and 4 install Ubuntu normally.  For 2 and 3, I recommend doing the following partition tables:

### 1.1 Bios is in UEFI mode:

In the SSD drive install the following partitions:

* swap: with size at least half of the computer RAM.
* efi: 500 MB
* / : assign the rest of the memory available

In (at least one of) the HDD drive:
* /home : assign all the memory

### 1.2 Bios in BIOS mode:
In the SSD drive install the following partitions:

* swap: with size at least half of the computer RAM.
* boot: 1000 MB
* / : assign the rest of the memory available

In (at least one of) the HDD drive:
* /home : assign all the memory

**Note:**  If the computer has more than one HDD drive, this could be use as a /data partition. I will provide instructions on how to do this also, but not yet.

**Once installed**: After a machine is installed please type `sudo apt-get install openssh-server git`. Once you have install `ssh` and `git`, place the machine where you want, but make sure it is connected to the internet, and with an IP assigned. Install all the machines you want to set up.

### 1.3 Some Linux installation Advices

Things that you might find usefull. They are not necessary:

#### 1.3.1 Disable nouveau drivers

You might need to disable nouveau drivers after nvidia-drivers installation. To do this:

```
#disable drivers nouveau
sudo vi /etc/modprobe.d/blacklist-nouveau.conf
# add the following lines in the file:
	blacklist nouveau
	options nouveau modeset=0
# Then close the file and run in the command line
sudo update-initramfs -u
sudo reboot
```

#### 1.3.2 Disable secure boot

Disable secure boot in the bios is important for remote managment. This is because if not drivers must be signed/trusted in order to be loaded by the kernel.

#### 1.3.3 How to mount a new device
I will add how to mount another HDD as a data partition

#### 1.3.4 Wake up online
How to wake up your computer from remote. Two options are here. When the computer has been shut down, and when the computer has been shutdown and the current has been cut (for instance if you plug off the power-supply wire). This is configured in bios plus a script

#### 1.3.5 Configure daemon
How to configure a daemon that monitor, for instance, the temperature of several machines using `dsh`

### 1.4 Update Ubuntu version

To update to a new ubuntu version here are the steps:

* Uninstall drivers
* Deactivate users from log in
* ```sudo apt update``` 
* ```sudo apt upgrade -y``` 
* ```sudo apt --purge autoremove``` (ubuntu 18 and later) 
* ``` sudo apt-get dist-upgrade ``` 
* ``` sudo reboot ```
* ``` sudo do-release-upgrade ``` 
	* **NOTE** Sometimes it is required to set the option development `sudo do-release-upgrade -d` to install the last LTS. This is the case of ubuntu20 in June 2020. Perhaps this is because as the new ubuntu 20 LTS is recent it hasnt been added to the normal release-upgrade mode.
* Disable nouveau drivers again. Follow step **1.3.1 Disable nouveau drivers** above.
* Reinstall Nvidia driver
* Reinstall whatever you want to reinstall (for example other versions of python)


## 2. Software Installation.

Now make sure you can connect to each of the machines through `ssh`. After, just clone this repository in the home folder i.e. `/home/username/`, of each of the machines you want to install.

On each of the machines,  execute the `install_repository.sh` file inside the respository. This will copy the necessary files for the installation. You can change this file in order to copy for different machines where the software might be placed. This will speed up the process of copying.

Then, type the following sequence of commands. This will avoid the computer asking for the password each time you type `sudo`. This will be usefull for remotely controlling several machines, see the **Managment  Utils** section. 

```sudo visudo```

and at the end of the file paste the following:

```prhlt ALL=(ALL) NOPASSWD:ALL```


Now you are ready to install the software. Installation files are provided in a way so that new machines can be easily installed, while current machines can be updated. 

Files are designed to run sequentially, without stopping too much. However, as some software require you to provide some installation directories and currently I am lazy to see how can we automatically set this by arguments, on each machines you have to log in and then run the next sequence of files. There is no way to do it with ```dsh``` from the main computer. I provide an insight on how you can install or update all the machines at the same time in the **Managment Utils** section. 

Each of the files must be run in the following way:
`sudo ./file.sh username`

where `username` is the current name where the respository is placed. For instance if you clone the repository in `/home/jmaronasm/` then you should run:

`sudo ./file.sh jmaronasm`

On the other hand, if you wish to modify my scripts in order to also install python virtual enviroments. I recommend  to run the file in the following way:

`sudo su`
`./file.sh jmaronasm`

The sequence of files `file.sh` must be run in the following order:

1. run ```install.sh```
2. run ```update_date.sh``` files

where ```date``` is the date when the update was done. This files must be ran in date order. This is very important. For instance, a correct  sequence is:
* ```./install.sh```
* ```./update_21_03_2019.sh```
*  ```./update_17_05_2019.sh```

An **incorrect** sequence could be:

* ```./install.sh```
* ```./update_21_06_2020.sh```
*  ```./update_04_03_2020.sh```

This will allow you to create update files for your current machines and, by running the `install.sh` file followed by the `update_dat.sh` files you can install new machines without the need of creating a different `install.sh` file.

**Example** To motivate this way of installing things, consider the following example. You have installed cuda8 in your machines. After one year, you update your machines and add also cuda 9 and cuda10. After one more year, you decide to erase cuda 8. One year later, a set of ten new machines comes to your lab, and you want them to have exactly the same software as the others. Instead of creating a new file that installs only cuda 9 and 10, you can run all the files in order. The first file will install cuda 8, and the updates files will erase it and install cuda 9. This helps a lot in setting up machines quickly. However, I recommend, each year, to merge the `install.sh` and `update_date.sh` files and create a new `install.sh` file, to avoid running several scripts that install and uninstall software. 

## 2.1 Examples

Once you have installed your enviroment, which will install many of the tools needed for machine learning softwares, I provide an example on how to install many of the softwares.  I also provide some types on how to proceed. For instance in torch I found that the installation changed when compiling against cuda 9 instead of cuda 8. You can find them in the [examples folder](https://github.com/jmaronas/prhltgpu.software.installation/tree/master/examples) of **this public repository**. 

In the examples folder you can find  how to install the following softwares withing the  PRHLTGPU software configuration:

* pytorch
* tensorflow
* keras
* srilm
* torch with cuda
* torch with laia and cuda
* kaldi with gpu
* opencv
* java

**Note:** If you wish to provide examples on how to install  other software within our framework, make a pull request.  This could be the case of **PyLaia**, **P2PALA**, **OpenNMT** and **EDDL**. 

**Note:** I will only be updating the files of the softwares that I use. This means that **updates/suggestions over the provided files are VERY welcome!!**. 

## 3. Management Utils

In this last section I provide some utils on how you can manage several machines using the `dsh` command. These files can be found in the `./utils/` after requesting the respository. 

 Previous to run the files you must create a file named `gpu_machines.lst`. This file must contain the full ip direction of the machine you want to connect to. See file `gpu_machines.lst`  provided in this [public repository](https://github.com/jmaronas/prhltgpu.software.installation/blob/master/gpu_machines.lst) (the ips are invented), . 

Also you must configure the ssh public and private keys from host and remote machine so that no password is required when log into a specific machine.  A guide is provided [here.](https://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id/) If you are able to log into your machine without being asked the password, then you have configure it correctly. You should also need to configure the machines in a way that when typing sudo, you the passwords is not requested, see section **2. Software Installation**.

Different functionalities are provided. The idea is to run these utilities from the main computer, that will manage to get different aspects from all the machines in only one command, i.e. there is no need to connect to each of the machines separately (as you do when installing):

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
* ```gpu_install_drivers.sh``` This file installs the drivers if they are corrupted. 
* ```get_inactive_accounts.sh``` This file checks (in a very hacky way) if a user has used his account at some point. 

* To restrict temporal access to a user run: ``` sudo usermod --expiredate 1 $username ```
* To reactivate an account run: ``` sudo usermod --expiredate "" $username ```
* To allow a non-root user to use docker you have to first create the docker group running: ```  sudo groupadd docker ```
	* Then each user is added with  ```sudo usermod -aG docker [non-root username]``` 	 

**IMPORTANTE NOT:**  It is interesting to remark that if you modify my installation scripts so no interaction is requried (for instance to provide the installation path), then you can run the `dsh` command to install all the machines from your host, i.e. there is no need to log in separately to each of the machines. The command would be something like:

`dsh -f /home/jmaronasm/gputools/utils/gpu_machines.lst -M -c 'cd /home/prhlt/gputools/install/; sudo ./install.sh prhlt; ./update_21_03_2018.sh; ./update_24_03_2018.sh' `

With only this line you install all the machines listed in the `gpu_machines.lst` file

## Acknowledgment

I will like to acknowledge the support of Lorenzo Quiros, Mario Parreño, Jose Prieto and Miguel Dominguez in  many aspects of the PRHLTGPU managment.

## TODO

* [ ] Add an example on how to run Jupyters on the PRHLT gpu machines. 


