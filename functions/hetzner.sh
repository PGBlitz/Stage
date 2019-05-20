#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
hetzner () {
  if [ -e "$file" ]; then rm -rf /bin/hcloud; fi
  version="v1.10.0"
  wget -P /pg/pg/tmp "https://github.com/hetznercloud/cli/releases/download/$version/hcloud-linux-amd64-$version.tar.gz"
  tar -xvf "/pg/pg/tmp/hcloud-linux-amd64-$version.tar.gz" -C /pg/pg/tmp
  mv "/pg/pg/tmp/hcloud-linux-amd64-$version/bin/hcloud" /bin/
  rm -rf /pg/pg/tmp/hcloud-linux-amd64-$version.tar.gz
  rm -rf /pg/pg/tmp/hcloud-linux-amd64-$version
}
