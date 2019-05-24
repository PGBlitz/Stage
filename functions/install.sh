#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
updateprime () {
# easy start var for easy installer
core serverid

# Set variable numbers, plus number up to force update
versioninfo

echo "FLAG - Installing Key Functions"

# establish temp variables
path78="/pg/stage/functions"

# key parts
source "${path78}/core.sh"
source "/pg/stage/versions.sh"

echo "SYSTEM: Installing Main Functions"

# assistive parts
source "${path78}/aptupdate.sh"
source "${path78}/cleaner.sh"
source "${path78}/dependency.sh"
source "${path78}/docker.sh"
source "${path78}/customcontainers.sh"
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

alias_install () { bash /pg/stage/alias/ccomands.sh }
folders () { bash /pg/stage/functions/install/folders.sh }
motd () {
  ansible-playbook /opt/plexguide/menu/motd/motd.yml }
prune () {
  ansible-playbook /opt/plexguide/menu/prune/main.yml }

# Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
pgcore() {
  if [ ! -e "/opt/coreapps/place.holder" ]; then
  ansible-playbook /pg/appscore/pgboxcore.yml; fi }
pgcommunity() {
  if [ ! -e "/opt/communityapps/place.holder" ]; then
  ansible-playbook /opt/plexguide/menu/pgbox/pgboxcommunity.yml; fi }

downloadpg() {
  rm -rf /opt/plexguide
  git clone https://github.com/PGBlitz/PGBlitz.com.git /opt/plexguide && cp /pg/appscommunity/menu/interface/alias/templates/plexguide /bin/
  cp /opt/plexguide/menu/interface/alias/templates/plexguide /bin/plexguide
}

exitcheck() {
  bash /opt/plexguide/menu/version/file.sh
file="/pg/var/exited.upgrade"
if [ ! -e "$file" ]; then
	bash /opt/plexguide/menu/interface/ending.sh
else
	rm -rf /pg/var/exited.upgrade 1>/dev/null 2>&1
	echo ""
	bash /opt/plexguide/menu/interface/ending.sh; fi
}
