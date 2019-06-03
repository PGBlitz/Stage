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
  # - good - core pythonstart
  # - good - core aptupdate
  core alias_install &>/dev/null &
  # - good - core folders
  # - good - serverid
  # - good - core dependency
  # - good - core mergerinstall
  # - ok (need to skip those ignore containers - core dockerinstall)
  # - good - core dockerassist
  echo "FLAG1"
  # Roles Ensure that PG Replicates and has once if missing; important for startup, cron and etc
  pgapps

  # Complete Rest of the Process
  # portainer
  # pgui
  echo "FLAG2"
  core motd &>/dev/null &
  core hetzner &>/dev/null &
  # [good] core gcloud
  # core watchtower
  echo "FLAG3"
  core prune
  echo "FLAG4"
  pgedition
  echo "FLAG5"
  echo "FLAG6"
  emergency
  echo "FLAG7"
  pguinotice
  pgdeploy
}
