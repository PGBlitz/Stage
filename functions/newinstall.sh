#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
newinstall () {
  rm -rf /pg/var/pg.exit 1>/dev/null 2>&1
  file="/pg/var/new.install"
  if [ ! -e "$file" ]; then
    touch /pg/var/pg.number && echo off > /pg/tmp/program_source
    bash /opt/plexguide/menu/version/file.sh
    file="/pg/var/new.install"
    if [ ! -e "$file" ]; then exit; fi
 fi
}
