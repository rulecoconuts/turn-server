#!/usr/bin/env bash
env $(cat .env | xargs) bash generateTurnConf.sh;