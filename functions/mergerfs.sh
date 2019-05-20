#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
mergerinstall () {

  ub16check=$(cat /etc/*-release | grep xenial)
  ub18check=$(cat /etc/*-release | grep bionic)
  deb9check=$(cat /etc/*-release | grep stretch)
  activated=false

    apt --fix-broken install -y
    apt-get remove mergerfs -y
    mkdir -p /pg/var

    if [ "$ub16check" != "" ]; then
    activated=true
    echo "ub16" > /pg/var/mergerfs.version
    wget "https://github.com/trapexit/mergerfs/releases/download/2.25.1/mergerfs_2.25.1.ubuntu-xenial_amd64.deb"

    elif [ "$ub18check" != "" ]; then
      activated=true
      echo "ub18" > /pg/var/mergerfs.version
      wget "https://github.com/trapexit/mergerfs/releases/download/2.25.1/mergerfs_2.25.1.ubuntu-bionic_amd64.deb"

    elif [ "$deb9check" != "" ]; then
      activated=true
      echo "deb9" > /pg/var/mergerfs.version
      wget "https://github.com/trapexit/mergerfs/releases/download/2.25.1/mergerfs_2.25.1.debian-stretch_amd64.deb"

    elif [ "$activated" != "true" ]; then
      activated=true && echo "ub18 - but didn't detect correctly" > /pg/var/mergerfs.version
      wget "https://github.com/trapexit/mergerfs/releases/download/2.25.1/mergerfs_2.25.1.ubuntu-bionic_amd64.deb"
    else
      apt-get install g++ pkg-config git git-buildpackage pandoc debhelper libfuse-dev libattr1-dev -y
      git clone https://github.com/trapexit/mergerfs.git
      cd mergerfs
      make clean
      make deb
      cd ..
    fi

    apt install -y ./mergerfs*_amd64.deb
    rm mergerfs*_amd64.deb
}
