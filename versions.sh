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
# PGStore command can be found @ core.sh
pgstore "mergerinstall" "1"
pgstore "pythonstart" "1
pgstore "aptupdate" "1"
pgstore "preinstall" "1"
pgstore "folders" "1"
pgstore "dockerinstall" "1"
pgstore "server" "1"
pgstore "serverid" "1"
pgstore "dependency" "1"
pgstore "dockerassist" "1"
pgstore "motd" "1"
pgstore "alias" "1"
pgstore "cleaner" "1"
pgstore "gcloud" "1"
pgstore "hetzner" "1"
pgstore "watchtower" "1"
pgstore "installer" "1"
pgstore "prune" "1"
pgstore "mountcheck" "1"
}
