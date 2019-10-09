#!/bin/bash
die() {
  echo >&2 "$@"
  exit 1
}

INDEX=$1
HOST=$2
DATAFILE=$3

echo $#

[ $# -eq 3 ] || die "3 argument required, $# provided. Required arguments: INDEX HOST DATAFILE"

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST)
[ "$STATUS" -eq 200 ] || die "Host is not reachable."

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST/$INDEX)
[ "$STATUS" -eq 200 ] || die "Invalid Index name."

curl -s -XPUT $HOST/$INDEX/_bulk -H "Content-Type: application/x-ndjson" --data-binary '@'$DATAFILE
