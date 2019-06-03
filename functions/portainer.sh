#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
portainer () {
  dstatus=$(docker ps --format '{{.Names}}' | grep "portainer")
  if [ "$dstatus" != "portainer" ]; then
    bash /pg/apps/apps/portainer/start.sh
  fi
}
