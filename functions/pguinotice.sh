#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pguinotice () {

# note that this is only a one time notice for new installs
if [[ ! -e "/pg/var/pgui.notice" ]]; then

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
↘️  PG User Interface (PGUI) Installed
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INFORMATION:
PGUI is a simple interface that provides information,
warnings, and stats that will assist both yourself and tech support!

WARNING:
If not secure, anyone in the world can visit your interface! Protect it by
deploy PGShield later on!

TO TURN OFF:
To turn this off, goto settings and turn it off/on the PG User Interface!

VISIT:
https://pgui.domain.com | http://pgui.domain.com:8555 | ipv4:8555
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -p 'Acknowledge Info | Press [ENTER] ' typed < /dev/tty
touch > /pg/var/pgui.notice
fi
}
