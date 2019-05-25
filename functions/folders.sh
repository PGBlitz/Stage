#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
folders () {

  fcreate () {
    if [[ ! -e "$1" ]]; then
      mkdir -p "$1"
      chown 1000:1000 "$1"
      chmod 0775 "$1"; fi
      echo "Generated Folder: $1"
  }

  echo ""
  #start
  fcreate /pg/transfer

  #gcrypt
  fcreate /pg/gc
    fcreate /pg/gc/tv
    fcreate /pg/gc/movies
    fcreate /pg/gc/music
    fcreate /pg/gc/ebooks

  #gdrive
  fcreate /pg/gd
    fcreate /pg/gd/tv
    fcreate /pg/gd/movies
    fcreate /pg/gd/music
    fcreate /pg/gd/ebooks

  #tcrypt
  fcreate /pg/tc
    fcreate /pg/tc/tv
    fcreate /pg/tc/movies
    fcreate /pg/tc/music
    fcreate /pg/tc/ebooks

  #tdrive
    fcreate /pg/td/tv
    fcreate /pg/td/movies
    fcreate /pg/td/music
    fcreate /pg/td/ebooks

  #unity
    fcreate /pg/unity

  #misc
    fcreate /pg/tmp
    fcreate /pg/data
    fcreate /pg/data/portainer
    fcreate /pg/coreapps
    fcreate /pg/communityapps
    fcreate /pg/transfer
    fcreate /pg/logs
    fcreate /pg/var/keys
    fcreate /pg/nzb
    fcreate /pg/torrent
    fcreate /pg/downloads

echo ""
}
