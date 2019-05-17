#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pgui ()
{
  file="/pg/var/pgui.switch"
    if [ ! -e "$file" ]; then echo "On" > /pg/var/pgui.switch; fi

    pguicheck=$(cat /pg/var/pgui.switch)
  if [[ "$pguicheck" == "On" ]]; then

    dstatus=$(docker ps --format '{{.Names}}' | grep "pgui")
    if [ "$dstatus" != "pgui" ]; then
    bash /opt/plexguide/menu/pgcloner/solo/pgui.sh
    ansible-playbook /opt/pgui/pgui.yml
    fi
fi
}
