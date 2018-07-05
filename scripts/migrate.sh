#!/usr/bin/env bash

cd contract-dev-pack
ganache-cli -p 7545 > /dev/null & pid=$!
if ps | grep $pid;
then
  echo "Running ganache..."
else
  echo "Failed to run ganache on 7545 port. Please check whether another one is already using the port"
  exit 1
fi
sleep 5
truffle migrate
sleep 5
cd ..
mocha
echo "Terminating ganache..."
kill -9 $pid
