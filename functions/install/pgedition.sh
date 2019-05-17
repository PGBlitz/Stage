#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pgedition () {
  file="/pg/var/path.check"
  if [ ! -e "$file" ]; then touch /pg/var/path.check && bash /opt/plexguide/menu/dlpath/dlpath.sh; fi
  # FOR PG-BLITZ
  file="/pg/var/project.deployed"
    if [ ! -e "$file" ]; then echo "no" > /pg/var/project.deployed; fi
  file="/pg/var/project.keycount"
    if [ ! -e "$file" ]; then echo "0" > /pg/var/project.keycount; fi
  file="/pg/var/server.id"
    if [ ! -e "$file" ]; then echo "[NOT-SET]" > /pg/var/rm -rf; fi
}
