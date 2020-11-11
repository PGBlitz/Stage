admin90210="admin90210"
sleep 10

while [[ "$admin90210" == "admin90210" ]]; do

  if [[ -e "/pg/nzbget" ]]; then
  chmod -R 775 /pg/nzbget
  chown -R 1000:1000 /pg/nzbget; fi

  if [[ -e "/pg/sabnzbd" ]]; then
  chmod -R 775 /pg/sabnzbd
  chown -R 1000:1000 /pg/sabnzbd; fi

  if [[ -e "/pg/rutorrent" ]]; then
  chmod -R 775 /pg/rutorrent
  chown -R 1000:1000 /pg/rutorrent; fi

  if [[ -e "/pg/qbitorrent" ]]; then
  chmod -R 775 /pg/qbitorrent
  chown -R 1000:1000 /pg/qbitorrent; fi

done
