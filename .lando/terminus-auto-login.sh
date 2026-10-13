#!/bin/sh

# Read the token at startup instead of embedding it in container configuration.
task_env_file="${LANDO_MOUNT:-/app}/.env.lando"
if [ -f "$task_env_file" ]; then
  . "$task_env_file"
fi

if [ -z "${PANTHEON_MACHINE_TOKEN:-}" ]; then
  echo 'Pantheon auto-login skipped: set PANTHEON_MACHINE_TOKEN in .env.lando.'
  exit 0
fi

if terminus auth:login --machine-token="$PANTHEON_MACHINE_TOKEN"; then
  echo 'Pantheon auto-login completed.'
  terminus auth:whoami || echo 'Unable to display the authenticated Pantheon account.' >&2
else
  echo 'Pantheon auto-login failed. Check your machine token; local services remain available.' >&2
  exit 0
fi
