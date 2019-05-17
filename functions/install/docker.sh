#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
dockerinstall () {
  ospgversion=$(cat /pg/var/os.version)
  if [ "$ospgversion" == "debian" ]; then
    ansible-playbook /opt/plexguide/menu/pg.yml --tags dockerdeb
  else
    ansible-playbook /opt/plexguide/menu/pg.yml --tags docker
    # If Docker FAILED, Emergency Install
    file="/usr/bin/docker"
    if [ ! -e "$file" ]; then
        clear
        echo "Installing Docker the Old School Way - (Please Be Patient)"
        sleep 2
        clear
        curl -fsSL get.docker.com -o get-docker.sh
        sh get-docker.sh
        echo ""
        echo "Starting Docker (Please Be Patient)"
        sleep 2
        systemctl start docker
        sleep 2
    fi

    ##### Checking Again, if fails again; warns user
    file="/usr/bin/docker"
    if [ -e "$file" ]
      then
      sleep 5
    else
      echo "INFO - FAILED: Docker Failed to Install! Exiting PGBlitz!"
        exit
      fi
  fi
}

docstart () {
ansible-playbook /opt/plexguide/menu/pg.yml --tags docstart
}
