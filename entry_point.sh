if [ -z "$HUB_PORT_4444_TCP_ADDR" ]; then
  echo Not linked with a running Hub container 1>&2
  exit 1
fi

ip="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

phantomjs --webdriver=$ip:8080 --webdriver-selenium-grid-hub=http://$HUB_PORT_4444_TCP_ADDR:$HUB_PORT_4444_TCP_PORT
