#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################

#stands for create commands (cc)
ccommands () {

  ccreate () {
      cp "/pg/stage/alias/$1" "/bin/$1"
      chown 1000:1000 "/bin/$1"
      chmod 0775 "/bin/$1"
      echo "Alias Command: Installed [$1]"
  }

  #start
  echo ""
  ccreate autoremove
  ccreate backup
  ccreate install
  ccreate nufs
  ccreate pg
  ccreate pgblitz
  ccreate pgfork
  ccreate pgupdate
  ccreate pgvpn
  ccreate plexguide
  ccreate prune
  ccreate reboot
  ccreate slist
  ccreate sufs
  ccreate update
  ccreate upgrade
}

ccommands
