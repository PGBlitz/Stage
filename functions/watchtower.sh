#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
watchtower () {

  # Generates App List From Core Apps
  ls -la /pg/coreapps/apps/ | sed -e 's/.yml//g' \
  | awk '{print $9}' | tail -n +4  > /pg/blitz/app.list

  # Generates App List From Community Apps
  ls -la /pg/community/apps/ | sed -e 's/.yml//g' \
  | awk '{print $9}' | tail -n +4  >> /pg/blitz/app.list # use >> to add to current list

  # Exemption List to Prevent WatchTower from Adding
  sed -i -e "/traefik/d" /pg/blitz/app.list
  sed -i -e "/image*/d" /pg/blitz/app.list
  sed -i -e "/_appsgen.sh/d" /pg/blitz/app.list
  sed -i -e "/_c*/d" /pg/blitz/app.list
  sed -i -e "/_a*/d" /pg/blitz/app.list
  sed -i -e "/_t*/d" /pg/blitz/app.list
  sed -i -e "/templates/d" /pg/blitz/app.list
  sed -i -e "/retry/d" /pg/blitz/app.list
  sed -i "/^test\b/Id" /pg/blitz/app.list
  sed -i -e "/nzbthrottle/d" /pg/blitz/app.list
  sed -i -e "/watchtower/d" /pg/blitz/app.list
  sed -i "/^_templates.yml\b/Id" /pg/blitz/app.list
  sed -i -e "/oauth/d" /pg/blitz/app.list
  sed -i -e "/dockergc/d" /pg/blitz/app.list
  sed -i -e "/pgui/d" /pg/blitz/app.list

  while read p; do
    echo -n $p >> /pg/tmp/watchtower.set
    echo -n " " >> /pg/tmp/watchtower.set
  done </pg/var/app.list

  ansible-playbook /pg/stage/ymls/watchtower.yml
}
