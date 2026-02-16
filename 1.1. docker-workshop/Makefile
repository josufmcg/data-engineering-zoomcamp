
.PHONY: db

docker-network:
	docker network create pg-network

db:
	docker run --rm -it \
		-e POSTGRES_USER="root" \
		-e POSTGRES_PASSWORD="root" \
		-e POSTGRES_DB="ny_taxi" \
		-v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
		-p 5432:5432 \
		--network=pg-network \
  		--name pgdatabase \
		postgres:16

pgadmin:
	docker run --rm -it \
		-e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
		-e PGADMIN_DEFAULT_PASSWORD="root" \
		-v pgadmin_data:/var/lib/pgadmin \
		-p 8085:80 \
		--network=pg-network \
		--name pgadmin \
		dpage/pgadmin4

.PHONY: pgcli
pgcli:
	uv run pgcli -h localhost -p 5432 -u root -d ny_taxi

.PHONY: jupyter
jupyter:
	uv run jupyter notebook

.PHONY: jupyter-export
jupyter-export:
	uv run jupyter nbconvert --to=script notebook.ipynb --output=ingest_data

.PHONY: build
build:
	docker build -t taxi_ingest:v001 .

.PHONY: shell
shell:
	docker run --rm -it --entrypoint bash taxi_ingest:v001

.PHONY: ingest
ingest:
	uv run python ingest_data.py \
		--user=root \
		--password=root \
		--host=localhost \
		--port=5432 \
		--db=ny_taxi \
		--table=yellow_taxi_trips

.PHONY: docker-ingest
docker-ingest:
	docker run --rm -it --network=pg-network taxi_ingest:v001 \
		--pg-user=root \
		--pg-pass=root \
		--pg-host=pgdatabase \
		--pg-port=5432 \
		--pg-db=ny_taxi \
		--target-table=yellow_taxi_trips
