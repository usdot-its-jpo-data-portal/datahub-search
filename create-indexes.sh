#!/bin/bash
die() {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 2 ] || die "2 arguments required, $# provided. Required arguments: INDEX HOST"

INDEX=$1
HOST=$2

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST)
[ "$STATUS" -eq 200 ] || die "Host is not reachable."

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST/$INDEX)
[ "$STATUS" -ne 200 ] || die "Index already exists"


#Create Index: Projects
echo 'Created index: '$INDEX
curl -s -XPUT $HOST/$INDEX/ -H "Content-Type: application/json" -d @index-dataassets-std.json
echo
echo 'end'
