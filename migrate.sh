docker run -d --name kong-database \
                -p 5432:5432 \
                -e "POSTGRES_USER=kong" \
                -e "POSTGRES_DB=kong" \
                -v $PWD/postgres/data:/var/lib/postgresql/data \
                postgres:10.1-alpine

docker run --rm \
    --link kong-database:kong-database \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
 #   -v $PWD/kong:/usr/local/kong \
    -v $PWS/kong/:/etc/kong/ \
    kong:0.12.1 kong migrations up
