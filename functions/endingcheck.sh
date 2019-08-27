#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
endingcheck() {
  bash /pg/stage/version/file.sh
  file="/pg/var/exited.upgrade"
  if [ -e "$file" ]; then
    rm -rf /pg/var/exited.upgrade 1>/dev/null 2>&1
    echo ""
  fi
}

bash /pg/stage/files/ending.sh
