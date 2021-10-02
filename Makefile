all: build

build:
	docker build -t sparanoid/almace-scaffolding:latest .

run:
	docker run --rm -it -p 4321:4321 --name amsf sparanoid/almace-scaffolding:latest

up:
	docker compose down -v --remove-orphans && docker compose up

push:
	docker push sparanoid/almace-scaffolding:latest

stop:
	docker rm -f amsf

clean:
	docker rmi sparanoid/almace-scaffolding:latest
