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
  bash /pg/stage/functions/gcechecker.sh
  core pythonstart
  core aptupdate
  core alias_install &>/dev/null &
  core folders
  serverid
  core dependency
  core mergerinstall
  core dockerinstall)
  core dockerassist

  # Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
  pgapps

  # Complete Rest of the Process
  portainer
  pgui
  core motd &>/dev/null &
  core hetzner &>/dev/null &
  core gcloud
  core watchtower
  core prune
  pgedition
  emergency
  pguinotice
  pgdeploy
}
