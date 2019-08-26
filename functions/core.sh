#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pgstore () {
  maindir="/pg/var/install"
  if [[ ! -e "${maindir}/${1}" ]]; then echo "${2}" > "${maindir}/${1}"; fi
  echo "${2}" > "${maindir}/${1}"
}

pgrecall () {
  maindir="/pg/var/install"
  if [[ ! -e "${maindir}/${1}" ]]; then touch "${maindir}/${1}"; fi
  recallvar=$(cat "${maindir}/${1}")
}

variable () {
  file="$1"
  if [ ! -e "$file" ]; then echo "$2" > $1; fi
}

vartouch () {
  file="$1"
  if [ ! -e "$file" ]; then touch "$1"; fi
}

core () {
    mkdir -p "/pg/var/install"
    vartouch "/pg/var/install/${1}.stored"
    start=$(cat "/pg/var/install/${1}")
    stored=$(cat "/pg/var/install/${1}.stored")
    if [[ "$start" != "$stored" ]]; then
      "$1"
      cat "/pg/var/install/${1}" > "/pg/var/install/${1}.stored";
    fi
}
