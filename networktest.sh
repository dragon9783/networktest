#! /bin/sh

if [ ! -d "/var/log/networktest" ]; then
  mkdir -p /var/log/networktest/
fi

while true
do
  if ! ping -c 1 -W 2 github.com  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "ping github.com  ->  failed" >> /var/log/networktest/networktest.log
  fi
  if ! nc -v -w 2 -z -i 1 github.com 443  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "nc github.com port 443  ->  failed" >> /var/log/networktest/networktest.log
  fi
  if ! nc -v -w 2 -z -i 1 docker.com 443  &> /dev/null; then
    echo `date "+%Y-%m-%d %H:%M:%S"` "nc docker.com port 443 ->  failed" >> /var/log/networktest/networktest.log
  fi
  sleep 1
done
