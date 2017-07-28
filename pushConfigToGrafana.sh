echo "Test Key"
echo "----------"

KEY=eyJrIjoiNHVvU1FIazYwcU1jYkhKcEtZY1Y2RDZFenF2b3hSMFciLCJuIjoiYWRtaW5LZXkiLCJpZCI6MX0=
HOST="https://apistat.services.alin.be/api"

curl -k -H "Authorization: Bearer $KEY" $HOST/dashboards/home

echo "ADD DATASOURCE"
echo "----------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"kong",
  "type":"graphite",
  "url":"http://morpheus.alin.be:7051",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"statd",
  "type":"graphite",
  "url":"https://statsd.services.alin.be/",
  "access":"proxy",
  "basicAuth":false
}'


