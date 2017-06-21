#!/bin/sh

COMMANDS_DIR=./commands

# $1 command to execute
COMMAND=$1

if [ -z ${COMMAND} ]
then
  echo "Available commands:"
  for entry in "${COMMANDS_DIR}"/*
  do
    echo "${entry##*/}"
  done
  exit 0
fi

shift # Ignores first argument (command name)
sh ${COMMANDS_DIR}/${COMMAND} $@
