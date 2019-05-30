#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
updateprime () {

# Set variable numbers, plus number up to force update
source "/pg/stage/versions.sh"
versioninfo

# establish temp variables
path78="/pg/stage/functions"

# key parts
source "${path78}/core.sh"
source "/pg/stage/versions.sh"

# assistive parts
source "${path78}/apps.sh"
source "${path78}/aptupdate.sh"
source "${path78}/dependency.sh"
source "${path78}/docker.sh"
source "${path78}/folders.sh"
source "${path78}/gcloud.sh"
source "${path78}/emergency.sh"
source "${path78}/hetzner.sh"
source "${path78}/mergerfs.sh"
source "${path78}/mountcheck.sh"
source "${path78}/newinstall.sh"
source "${path78}/pgdeploy.sh"
source "${path78}/pgedition.sh"
source "${path78}/pgui.sh"
source "${path78}/portainer.sh"
source "${path78}/pythonstart.sh"
source "${path78}/serverid.sh"
source "${path78}/watchtower.sh"
source "${path78}/pginstall.sh"
#source "${path78}/prune.sh"
source "${path78}/pgshield.sh"
}

apps () {
    # replicates apps is missing
    # primary purpose is to pull pgui and portainer
    bash /pg/stage/functions/apps.sh
}

alias_install () {
  bash /pg/stage/alias/ccomands.sh
}

folders () {
  bash /pg/stage/functions/folders.sh
}

motd () {
  ansible-playbook /pg/stage/ymls/motd/motd.yml
}

prune () {
  ansible-playbook /pg/stage/ymls/prune.yml
}

# Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
pgcore() {
  if [ ! -e "/pg/coreapps/place.holder" ]; then
  ansible-playbook /pg/pgblitz/menu/pgbox/pgboxcore.yml; fi
}

pgcommunity() {
  if [ ! -e "/pg/communityapps/place.holder" ]; then
  ansible-playbook /pg/pgblitz/menu/pgbox/pgboxcommunity.yml; fi
}

downloadpg() {
  rm -rf /pg/pgblitz
  git clone https://github.com/PGBlitz/PGBlitz.com.git /pg/pgblitz
  cp /pg/pgblitz/menu/interface/alias/templates/pg /bin
  cp /pg/pgblitz/menu/interface/alias/templates/plexguide /bin
  cp /pg/pgblitz/menu/interface/alias/templates/pgblitz /bin

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
