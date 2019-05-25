#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
watchtower () {
  watchtowergen
  ansible-playbook /opt/coreapps/apps/watchtower.yml
}

watchtowergen () {
  # Needs to be updated for PG9 in regards to future paths
  bash /opt/coreapps/apps/_appsgen.sh
  while read p; do
    echo -n $p >> /pg/tmp/watchtower.set
    echo -n " " >> /pg/tmp/watchtower.set
  done </pg/var/app.list
}
