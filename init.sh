#!/bin/bash
echo "system test" > /root/test_`date +%Y-%m-%d-%H:%M:%S`.log
echo 'nameserver 114.114.114.114' > /etc/resolv.conf
while true
do
  ping -c 114.114.114.114
  if [[ $? = 0 ]];then
    break
  fi

  if [[ $? != 0 ]];then
    echo " can not connect "
  fi
done
ssh  -CqTfnN -R 0.0.0.0:7001:127.0.0.1:22 root@openfaas.cn
autossh -M 7281 -fCNR 7280:127.0.0.1:22 root@openfaas.cn
