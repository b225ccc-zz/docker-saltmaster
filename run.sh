#!/bin/bash

# Exit on first error
set -e

# Handle environment variables
LOG_LEVEL=${LOG_LEVEL:-"error"}

# Environment setup

# check for directories

if [ ! -d /salt/config ]; then
  mkdir /salt/config
fi

if [ ! -d /salt/log ]; then
  mkdir /salt/log
fi

# terminate on fail with exec
exec /usr/bin/supervisord
