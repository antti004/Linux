#!/bin/bash

curl -fsSL https://repos.influxdata.com/influxdata-archive_compat.key -o /etc/apt/keyrings/influxdata-archive_compat.key
echo "deb [signed-by=/etc/apt/keyrings/influxdata-archive_compat.key] https://repos.influxdata.com/ubuntu stable main" | tee /etc/apt/sources.list.d/influxdata.list
apt update
apt -y install telegraf
