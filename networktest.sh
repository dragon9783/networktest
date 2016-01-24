#! /bin/sh

if [ ! -d "/var/log/networktest" ]; then
  mkdir -p /var/log/networktest/
fi

while true
do
  if ! ping -c 1 -W 2 github.com  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "ping github.com  ->  failed" >> /var/log/networktest/networktest.log
    logger -it remote -p local6.error -n 172.31.12.85 -P 514 -d "$(hostname) $(date +'%Y-%m-%d %H:%M:%S') ping github.com  ->  failed"
  fi
  if ! nc -v -w 2 -z -i 1 github.com 443  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "nc github.com port 443  ->  failed" >> /var/log/networktest/networktest.log
    logger -it remote -p local6.error -n 172.31.12.85 -P 514 -d "$(hostname) $(date +'%Y-%m-%d %H:%M:%S') nc github.com port 443  ->  failed"
  fi
  if ! nc -v -w 2 -z -i 1 docker.com 443  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "nc docker.com port 443 ->  failed" >> /var/log/networktest/networktest.log
    logger -it remote -p local6.error -n 172.31.12.85 -P 514 -d "$(hostname) $(date +'%Y-%m-%d %H:%M:%S') nc docker.com port 443  ->  failed"
  fi
  sleep 2
done
