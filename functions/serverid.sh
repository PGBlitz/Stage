#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
serverid () {

# Generates a Random Server ID until user changes via options/pgvault
if [ ! -e "/pg/var/server.id" ]; then
  echo "BLITZ-$((1 + RANDOM * RANDOM))" > /pg/var/server.id; fi

}
