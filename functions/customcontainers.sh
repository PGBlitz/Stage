#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
customcontainers () {
mkdir -p /opt/mycontainers
touch /pg/data/blitz/rclone.conf
mkdir -p /opt/communityapps/apps
rclone --config /pg/data/blitz/rclone.conf copy /opt/mycontainers/ /opt/communityapps/apps
}
