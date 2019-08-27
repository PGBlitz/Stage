#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
endingcheck() {
  bash /opt/plexguide/menu/version/file.sh
  file="/var/plexguide/exited.upgrade"
  if [ ! -e "$file" ]; then
    bash /opt/plexguide/menu/interface/ending.sh
  else
    rm -rf /pg/var/exited.upgrade 1>/dev/null 2>&1
    echo ""
    bash /opt/plexguide/menu/interface/ending.sh
  fi
}
