#!/bin/bash

echo "-------Uninstalling Package-------"

sudo apt-get purge $1 -y

echo "--------DONE!!----------"
