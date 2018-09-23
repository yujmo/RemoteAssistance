#!/bin/bash
mkdir /root/test/

ssh  -CqTfnN -R 0.0.0.0:7001:127.0.0.1:22 root@openfaas.cn
autossh -M 7281 -fCNR 7280:127.0.0.1:22 root@openfaas.cn
