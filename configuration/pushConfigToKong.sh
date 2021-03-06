echo "ADD APIS"
echo "----------"

curl -i -X POST \
  --url http://localhost:8001/apis/ \
  --data 'name=hello-api' \
  --data 'hosts=api.services.alin.be' \
  --data 'uris=/hello'  \
  --data 'strip_uri=true' \
  --data 'upstream_url=http://hello.services.alin.be/greeting'

curl -i -X POST \
  --url http://localhost:8001/apis/ \
  --data 'name=file-api' \
  --data 'hosts=api.services.alin.be' \
  --data 'uris=/file'  \
  --data 'strip_uri=true' \
  --data 'upstream_url=http://file.services.alin.be/archive'

curl -i -X POST \
  --url http://localhost:8001/apis/ \
  --data 'name=employer-api' \
  --data 'hosts=api.services.alin.be' \
  --data 'uris=/employer'  \
  --data 'strip_uri=true' \
  --data 'upstream_url=http://employer.services.alin.be/employer'

echo "ADD PLUGIN"
echo "----------"

curl -i -X POST \
  --url http://localhost:8001/apis/hello-api/plugins/ \
  --data 'name=rate-limiting' \
  --data 'config.second=5' \
  --data 'config.hour=10000'

curl -i -X POST \
  --url http://localhost:8001/apis/hello-api/plugins/ \
  --data 'name=tcp-log' \
  --data 'config.host=10.0.2.15' \
  --data 'config.port=5001'

curl -i -X POST \
  --url http://localhost:8001/apis/hello-api/plugins/ \
  --data 'name=statsd' \
  --data 'config.host=morpheus.alin.be' \
  --data 'config.port=7017'

curl -i -X POST \
  --url http://localhost:8001/apis/kong-api/plugins/ \
  --data 'name=basic-auth'

echo "ADD CONSUMER"
echo "----------"

curl -i -X POST \
  --url http://localhost:8001/consumers/ \
  --data 'username=admin'
 
curl -i -X POST http://localhost:8001/consumers/admin/basic-auth \
    --data "username=admin" \
    --data "password=PASSWORD"



#curl -i -X GET \
#  --url http://localhost:8001/apis/
