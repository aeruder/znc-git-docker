#!/bin/bash

set -eu -o pipefail

USER_ID=${LOCAL_USER_ID:-999}
echo "Starting with UID : $USER_ID"

useradd --shell /bin/false -u $USER_ID -o -c "" -m znc
chown znc /home/znc/.znc
exec /usr/sbin/gosu znc "$@"
