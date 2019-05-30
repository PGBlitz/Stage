#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pgapps () {
  if [ ! -e "/pg/apps/apps/portainer/start.sh" ]; then
    echo 'apps' > /pg/var/pgcloner.rolename
    echo 'Apps' > /pg/var/pgcloner.roleproper
    echo 'Apps' > /pg/var/pgcloner.projectname
    echo 'v90' > /pg/var/pgcloner.projectversion
    echo 'pgbox.sh' > /pg/var/pgcloner.startlink
    ansible-playbook "/pg/pgblitz/pgcloner/core/primary.yml"
  fi
}
