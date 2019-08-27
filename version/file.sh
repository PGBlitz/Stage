#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705 - Deiteq
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
mainstart() {
echo ""
echo "💬  Pulling Update Files - Please Wait"
file="/pg/pgstage/place.holder"
waitvar=0
while [ "$waitvar" == "0" ]; do
	sleep .5
	if [ -e "$file" ]; then waitvar=1; fi
done

rm -rf /pg/tmp/version.temp
touch /pg/tmp/version.temp

num=0
while read p; do
  echo -n $p >> /pg/tmp/version.temp
  echo -n " - " >> /pg/tmp/version.temp
  num=$[num+1]
  if [ "$num" == 7 ]; then
    num=0
    echo " " >> /pg/var/program.temp
  fi
done </pg/install/versions.sh

versionlist=$(cat /pg/tmp/version.temp)
versionlist=${versionlist::-2}

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📂  PG Update Interface | Current PG Version: $pgnumber
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Need More Info? Visit > versions.pgblitz.com

EOF

echo "${versionlist}"

tee <<-EOF

Quitting? TYPE > exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

break=no
read -p '🌍  TYPE a PG Version | PRESS ENTER: ' typed
storage=$(grep $typed /pg/install/versions.sh | head -n1 | awk '{print $1;}')

parttwo
}

parttwo() {
if [[ "$typed" == "exit" || "$typed" == "EXIT" || "$typed" == "Exit" ]]; then
  echo ""; touch /pg/var/exited.upgrade; exit; fi

if [ "$storage" != "" ]; then
  break=yes
  echo $storage > /pg/var/pg.number
  ansible-playbook /pg/stage/version/choice.yml

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅️  SYSTEM MESSAGE: Installing Verison - $storage - Standby!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
sleep 2
touch /pg/var/new.install

file="/pg/var/community.app"
if [ -e "$file" ]; then rm -rf /pg/var/community.app; fi

touch /pg/var/first.update
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅️   TYPE [pgblitz] or [pg] or [plexguide] to CONTINUE!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
sleep 1.5
pgblitz
exit
else
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  SYSTEM MESSAGE: Version $typed does not exist! - Standby!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  sleep 2
  mainstart
fi
}

#rm -rf /pg/pgstage
mkdir -p /pg/pgstage
if [[ ! -e "/pg/pgstage/place.holder" ]]; then
ansible-playbook /pg/pgblitz/menu/pgstage/pgstage.yml; fi

# user sets version install if not present
if [[ ! -e "/pg/var/first.update" ]]; then
  if [[ ! -e "/pg/install/versions.sh" ]]; then
  bash /pg/stage/pgcloner/solo/update.sh; fi
  mainstart

fi
