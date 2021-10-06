#!/bin/bash

# This script installs softwares, modules and packages needed to run the Django app for Noname API project
# 2021/10/04     Noela Tebid          Initial Deploy

# preq, edit settings.py with public ip of server

# install nginx

sudo apt update -y
sudo apt install nginx -y
cd /etc/nginx
sudo systemctl start nginx


echo nginx is running

# install python3 pip and python virtual env
sudo apt install python3-pip -y
sudo apt install python3-virtualenv

echo python pip and virtual environment installed

#setup for django

cd /home/ubuntu/
cd /home/ubuntu/noname/
virtualenv nenv                      #creates virtual environment to avoid dependency collision
source nenv/bin/activate

echo connected to virtual environment
pip install -r requirements.txt

echo dependencies have been installed

# install gunicorn

pip3 install gunicorn

cd /home/ubuntu/noname/
gunicorn --bind 0.0.0.0:9094 restapi.wsgi


