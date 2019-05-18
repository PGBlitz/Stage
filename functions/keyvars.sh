#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
keyvars () {

variable () {
  file="$1"
  if [ ! -e "$file" ]; then echo "$2" > $1; fi
}

vartouch () {
  file="$1"
  if [ ! -e "$file" ]; then touch "$1"; fi
}

############## Create / Update Key Variable upon Start Execution

# Pull IP Address & Store
hostname -I | awk '{print $1}' > /pg/var/server.ip

# Creates Default Path /pg for the processing HD
variable /pg/var/hd.path "/pg"



}
