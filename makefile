docker-postgres-up:
	docker pull postgres
	sleep 2
	docker run --name postgres-db -p 5432:5432 -e POSTGRES_PASSWORD=books -d postgres

docker-postgres-down:
	docker stop postgres-db
	sleep 2
	docker rm postgres-db

docker-postgres-run:
	docker exec -it postgres-db psql -U postgres

docker-pgadmin-up:
	docker pull dpage/pgadmin4
	sleep 2
	docker run -p 5050:80 --name=pgadmin-web -e "PGADMIN_DEFAULT_EMAIL=caprilespe@outlook.com" -e "PGADMIN_DEFAULT_PASSWORD=Passw0rd" -d dpage/pgadmin4

docker-pgadmin-down:
	docker stop pgadmin-web
	sleep 2
	docker rm pgadmin-web

docker-env-up:
	make docker-postgres-up
	sleep 2
	make docker-pgadmin-up

docker-env-down:
	make docker-postgres-down
	make docker-pgadmin-down
