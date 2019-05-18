#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
path78="/pg/stage/functions"
path79="/pg/stage/functions/install"

# key parts
source "${path78}/core.sh"
source "${path78}/easy.sh"

# assistive parts
source "${path79}/aptupdate.sh"
source "${path79}/cleaner.sh"
source "${path79}/dependency.sh"
source "${path79}/docker.sh"
source "${path79}/customcontainers.sh"
source "${path79}/gcloud.sh"
source "${path79}/emergency.sh"
source "${path79}/hetzner.sh"
source "${path79}/mergerfs.sh"
source "${path79}/mountcheck.sh"
source "${path79}/newinstall.sh"
source "${path79}/pgdeploy.sh"
source "${path79}/pgedition.sh"
source "${path79}/pgui.sh"
source "${path79}/portainer.sh"
source "${path79}/pythonstart.sh"
source "${path79}/serverid.sh"
source "${path79}/watchtower.sh"
source "${path79}/pginstall.sh"
source "${path79}/prune.sh"
source "${path79}/pgshield.sh"

updateprime () {
# easy start var for easy installer
easy=off

core serverid



# Set variable numbers, plus number up to force update
pgstore "install.merger" "1"
pgstore "install.python" "1"
pgstore "install.apt" "1"
pgstore "install.preinstall" "1"
pgstore "install.folders" "1"
pgstore "install.docker" "1"
pgstore "install.server" "1"
pgstore "install.serverid" "1"
pgstore "install.dependency" "1"
pgstore "install.dockerstart" "1"
pgstore "install.motd" "1"
pgstore "install.alias" "1"
pgstore "install.cleaner" "1"
pgstore "install.gcloud" "1"
pgstore "install.hetzner" "1"
pgstore "install.amazonaws" "1"
pgstore "install.watchtower" "1"
pgstore "install.installer" "1"
pgstore "install.prune" "1"
pgstore "install.mountcheck" "1"
}

alias_install () { ansible-playbook /opt/plexguide/menu/alias/alias.yml }
folders () { ansible-playbook /opt/plexguide/menu/installer/folders.yml }
motd () { ansible-playbook /opt/plexguide/menu/motd/motd.yml }
prune () { ansible-playbook /opt/plexguide/menu/prune/main.yml }
# Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
pgcore() { if [ ! -e "/opt/coreapps/place.holder" ]; then ansible-playbook /opt/plexguide/menu/pgbox/pgboxcore.yml; fi }
pgcommunity() { if [ ! -e "/opt/communityapps/place.holder" ]; then ansible-playbook /opt/plexguide/menu/pgbox/pgboxcommunity.yml; fi }

downloadpg() {
  rm -rf /opt/plexguide
  git clone https://github.com/PGBlitz/PGBlitz.com.git /opt/plexguide && cp /opt/plexguide/menu/interface/alias/templates/plexguide /bin/
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
	bash /opt/plexguide/menu/interface/ending.sh
fi
}
