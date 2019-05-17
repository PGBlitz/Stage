#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
pythonstart () {

  installedansible="$(ansible --version | head -n 1 | awk '{print $2}')"
  ansible="2.7.8"
  pip="19.0.2"

  apt-get install -y --reinstall \
      nano \
      git \
      build-essential \
      libssl-dev \
      libffi-dev \
      python3-dev \
      python3-pip \
      python-dev \
      python-pip
  python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall pip==${pip}
  python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall setuptools
  python3 -m pip install --disable-pip-version-check --upgrade --force-reinstall \
      pyOpenSSL \
      requests \
      netaddr
  python -m pip install --disable-pip-version-check --upgrade --force-reinstall pip==${pip}
  python -m pip install --disable-pip-version-check --upgrade --force-reinstall setuptools

  # Skip Ansible Install if Version Output Matches
  if [[ "$ansible" != "$installedansible" ]]; then
  pip install --disable-pip-version-check --upgrade --force-reinstall ansible==${1-$ansible}
  fi

  # Copy pip to /usr/bin
  cp /usr/local/bin/pip /usr/bin/pip
  cp /usr/local/bin/pip3 /usr/bin/pip3

  mkdir -p /etc/ansible/inventories/ 1>/dev/null 2>&1
  echo "[local]" > /etc/ansible/inventories/local
  echo "127.0.0.1 ansible_connection=local" >> /etc/ansible/inventories/local

  ### Reference: https://docs.ansible.com/ansible/2.4/intro_configuration.html
  echo "[defaults]" > /etc/ansible/ansible.cfg
  echo "command_warnings = False" >> /etc/ansible/ansible.cfg
  echo "callback_whitelist = profile_tasks" >> /etc/ansible/ansible.cfg
  echo "inventory = /etc/ansible/inventories/local" >> /etc/ansible/ansible.cfg

  # Variables Need to Line Up with pg.sh (start)
  touch /pg/var/background.1
}
