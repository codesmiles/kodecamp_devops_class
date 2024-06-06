#!/bin/bash

apt-get update
apt-get install -y mysql-server
systemctl enable mysql
systemctl start mysql
systemctl status mysql
