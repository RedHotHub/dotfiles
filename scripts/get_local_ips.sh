#!/bin/bash

ifconfig -a | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' | sort | uniq | awk '!/127.*/' | awk '!/.*\.255/' | sed -e 's|$|,|' | xargs | sed 's/.$//' 
