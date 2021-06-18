all: build

build:
	docker build -t sparanoid/amsf:latest .

run:
	docker run --rm -it -p 4321:4321 --name amsf sparanoid/amsf:latest

up:
	docker compose down -v --remove-orphans && docker compose up

push:
	docker push sparanoid/amsf:latest

stop:
	docker rm -f amsf

clean:
	docker rmi sparanoid/amsf:latest
