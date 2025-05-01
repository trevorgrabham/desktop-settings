#!/bin/bash
echo -e "======================================================================================================================================\n                                                               $(date +\%Y-\%m-\%d)\n======================================================================================================================================\n#####################\nUpdating package list\n#####################" >> /home/trevorgrabham/logs/apt-update.log 2>&1
apt-get update >> /home/trevorgrabham/logs/apt-update.log 2>&1
echo -e "\n#################\nUpdating packages\n#################" >> /home/trevorgrabham/logs/apt-update.log 2>&1
apt-get upgrade -y >> /home/trevorgrabham/logs/apt-update.log 2>&1
echo -e "\n########################\nRemoving unused packages\n########################" >> /home/trevorgrabham/logs/apt-update.log 2>&1
apt-get autoremove -y >> /home/trevorgrabham/logs/apt-update.log 2>&1
echo -e "Done\n" >> /home/trevorgrabham/logs/apt-update.log 2>&1
