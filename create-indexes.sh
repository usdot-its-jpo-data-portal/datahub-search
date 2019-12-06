#!/bin/bash
die() {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 3 ] || die "3 arguments required, $# provided. Required arguments: HOST, INDEX and INDEXFILE"

HOST=$1
INDEX=$2
INDEXFILE=$3

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST)
[ "$STATUS" -eq 200 ] || die "Host is not reachable."

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST/$INDEX)
[ "$STATUS" -ne 200 ] || die "Index [$INDEX] already exists"

echo 'Creating index: '$INDEX
curl -s -XPUT $HOST"/"$INDEX -H "Content-Type: application/json" -d @$INDEXFILE
echo

echo 'end'
