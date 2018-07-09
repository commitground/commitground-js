#!/usr/bin/env bash

cd `dirname "$0"` && cd ../commitground-contracts
ganache-cli -p 7545 > /dev/null & pid=$!
if ps -p $pid > /dev/null
then
  echo "Running ganache..."
else
  echo "Failed to run ganache on 7545 port. Please check whether another one is already using the port"
  exit 1
fi
sleep 5
truffle migrate
sleep 5
cd `dirname "$0"` && cd ..
mocha
echo "Terminating ganache..."
kill -9 $pid
