#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
source /pg/stage/version/file.sh

updateprime () {

# Set variable numbers, plus number up to force update
source "/pg/stage/versions.sh"
versioninfo

# key parts
source "/pg/stage/functions/core.sh"
source "/pg/stage/versions.sh"

# assistive parts
source "/pg/stage/functions/apps.sh"
source "/pg/stage/functions/ccommands.sh"
source "/pg/stage/functions/aptupdate.sh"
source "/pg/stage/functions/dependency.sh"
source "/pg/stage/functions/dockerinstall.sh"
source "/pg/stage/functions/dockerassist.sh"
source "/pg/stage/functions/folders.sh"
source "/pg/stage/functions/gcloud.sh"
source "/pg/stage/functions/emergency.sh"
source "/pg/stage/functions/hetzner.sh"
source "/pg/stage/functions/mergerinstall.sh"
source "/pg/stage/functions/pguinotice.sh"
source "/pg/stage/functions/newinstall.sh"
source "/pg/stage/functions/pgdeploy.sh"
source "/pg/stage/functions/pgedition.sh"
source "/pg/stage/functions/pgui.sh"
source "/pg/stage/functions/portainer.sh"
source "/pg/stage/functions/pythonstart.sh"
source "/pg/stage/functions/serverid.sh"
source "/pg/stage/functions/watchtower.sh"
source "/pg/stage/functions/pginstall.sh"
source "/pg/stage/functions/prune.sh"
source "/pg/stage/functions/pgshield.sh"
}

apps () {
    bash /pg/stage/functions/apps.sh
}

folders () {
  bash /pg/stage/functions/folders.sh
}

motd () {
  ansible-playbook /pg/stage/ymls/motd/motd.yml
}

ccommands () {
  ccommandsmain
}

pgui () {
    bash /pg/stage/functions/pgui.sh
}

prune () {
  ansible-playbook /pg/stage/ymls/prune.yml
}

downloadpg() {
  rm -rf /pg/pgblitz
  git clone https://github.com/PGBlitz/PGBlitz.com.git /pg/pgblitz
  cp /pg/pgblitz/menu/interface/alias/templates/pg /bin
  cp /pg/pgblitz/menu/interface/alias/templates/plexguide /bin
  cp /pg/pgblitz/menu/interface/alias/templates/pgblitz /bin
}

exitcheck() {
  bash /pg/pgblitz/menu/version/file.sh
  file="/pg/var/exited.upgrade"
  if [ ! -e "$file" ]; then
  	bash /pg/pgblitz/menu/interface/ending.sh
  else
  	rm -rf /pg/var/exited.upgrade 1>/dev/null 2>&1
  	echo ""
  	bash /pg/pgblitz/menu/interface/ending.sh
  fi
}
