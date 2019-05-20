#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pginstall () {
# Runs through the install process order
  updateprime
  bash /opt/plexguide/menu/pggce/gcechecker.sh
  core pythonstart
  core aptupdate
  core alias_install &>/dev/null &
  core folders
  core dependency
  core mergerinstall
  core dockerinstall
  core docstart

touch /pg/var/install.roles
rolenumber=3
  # Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
if [[ $(cat /pg/var/install.roles) != "$rolenumber" ]]; then
  rm -rf /pg/communityapps
  rm -rf /pg/coreapps
  rm -rf /pg/pgshield

  pgcore
  pgcommunity
  pgshield
  echo "$rolenumber" > /pg/var/install.roles
fi

  portainer
  pgui
  core motd &>/dev/null &
  core hetzner &>/dev/null &
  core gcloud
  core cleaner &>/dev/null &
  core watchtower
  core prune
  customcontainers &>/dev/null &
  pgedition
  core mountcheck
  emergency
  pgdeploy
}
