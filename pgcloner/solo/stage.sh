#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
readstage=$(jq -r '.pgstage' /pg/pgblitz/stage.json)

### FILL OUT THIS AREA ###
echo 'stage' > /pg/var/pgcloner.rolename
echo 'stage' > /pg/var/pgcloner.roleproper
echo 'PGStage' > /pg/var/pgcloner.projectname
echo "$readstage" > /pg/var/pgcloner.projectversion

### START PROCESS
ansible-playbook /pg/stage/pgcloner/core/primary.yml
