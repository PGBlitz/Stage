#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################

### FILL OUT THIS AREA ###
echo 'install' > /pg/var/pgcloner.rolename
echo 'install' > /pg/var/pgcloner.roleproper
echo 'Install' > /pg/var/pgcloner.projectname
echo 'v90' > /pg/var/pgcloner.projectversion
echo "FLAG1"
### START PROCESS
ansible-playbook /pg/stage/pgcloner/core/primary.yml
