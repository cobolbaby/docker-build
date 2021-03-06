#!/bin/bash

# docker node update --label-add alias=bdc03.infra.dev.tj.itc.inventec gp03
# mkdir /disk/prometheus && chmod -R 777 /disk/prometheus

# 推送启动脚本至部署目录
INVENTORY_FILE=../inventory.dev

# docker run --rm telegraf:1.13.0-alpine telegraf config > telegraf.default.conf
# sed '/^\s*#\|^$/d' ./deploy.dev/config/telegraf/telegraf.default.conf > ./deploy.dev/config/telegraf/telegraf.conf

# 传出配置文件
ansible -i $INVENTORY_FILE monitor1 -m copy -a "src=deploy.dev/ dest=/opt/prometheus" -b

# 执行启动命令
ansible -i $INVENTORY_FILE monitor1 -m shell -a "/opt/prometheus/bin/start.sh" -b