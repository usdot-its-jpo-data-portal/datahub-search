#!/bin/bash

if [ -z "$ELASTICSEARCH_URL" ]; then
    echo "Error: Required environment variable ELASTICSEARCH_URL not set."
    exit 1
fi

HOST=$ELASTICSEARCH_URL

STATUS=$(curl -so /dev/null -w '%{response_code}' $HOST)
if [ "$STATUS" -ne 200 ]; then
  echo 'Error: Connection to ES failed.'
  exit 1
fi

echo 'Creating index: DataAssets'
curl -s -XPUT $HOST/dataassets/ -H "Content-Type: application/json" -d @/schemas/dataassets-index.json
echo 'Done creating index: DataAssets'

echo 'Creating index: Related'
curl -s -XPUT $HOST/related/ -H "Content-Type: application/json" -d @/schemas/related-index.json
echo 'Done creating index: Related'

echo 'Adding data to index: DataAssets'
elasticdump --input=/data/dataassets-data.json --output=$ELASTICSEARCH_URL/dataassets --type=data
echo 'Done adding data to index: DataAssets'

echo 'Adding data to index: Related'
elasticdump --input=/data/related-data.json --output=$ELASTICSEARCH_URL/related --type=data
echo 'Done adding data to index: Related'