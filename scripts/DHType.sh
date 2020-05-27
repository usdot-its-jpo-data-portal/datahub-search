
# Set initial value for dataTypes
curl -X PUT -H "Content-Type: application/json" http://localhost:9200/dataassets/_mapping -d '{"properties":{"dhType":{"type":"text"}}}'
