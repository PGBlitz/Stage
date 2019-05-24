#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
dependency () {
  ospgversion=$(cat /pg/var/os.version)
  if [ "$ospgversion" == "debian" ]; then
    ansible-playbook /pg/stage/ymls/dependencydeb.yml;
  else
    ansible-playbook /pg/stage/ymls/dependencyubu.yml; fi
}
