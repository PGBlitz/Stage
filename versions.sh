#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
# Changing the Numbers Higher will result in force updating that section
################################################################################

# key parts
source "/pg/stage/functions/core.sh"

versioninfo () {
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
pgstore "install.watchtower" "1"
pgstore "install.installer" "1"
pgstore "install.prune" "1"
pgstore "install.mountcheck" "1"
}
