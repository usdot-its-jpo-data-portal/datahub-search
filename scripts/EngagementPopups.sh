
# Update configurations index mapping to add DataTypes structure
curl -X PUT -H "Content-Type: application/json" http://localhost:9200/configurations/_mapping -d '{"properties":{"engagementPopups":{"properties":{"content":{"type":"text"},"controlsColor":{"index":false,"type":"text"},"controlsShadow":{"index":false,"type":"text"},"description":{"type":"text"},"id":{"index":false,"type":"text"},"isActive":{"type":"boolean"},"lastModified":{"type":"date"},"name":{"type":"text"}}}}}'

# Set initial value for dataTypes
curl -X POST -H "Content-Type: application/json" http://localhost:9200/configurations/_doc/datahub-default-configuration/_update -d '{"doc": {"engagementPopups": []}}'
