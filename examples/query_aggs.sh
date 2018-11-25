#!/usr/bin/env bash
curl -X POST -H "Content-Type: application/json" "http://localhost:9200/postal_code/_search?pretty&size=0" -d @examples/aggs.txt
