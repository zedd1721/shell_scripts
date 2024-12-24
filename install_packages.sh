#!/bin/bash

<<note

This script will install any packages,
./install_packages.sh <arg>

note


echo "-----------------------Installing $1-------------------------"

sudo apt-get update
sudo apt-get install $1 -y

sudo systemctl start $1
sudo systemctl enable $1

echo "--------------------Installation Done!!!-----------------------"
