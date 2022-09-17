cbuild:
	conda-build .

cexport:
	rm environment.yml && conda env export > environment.yml

dbuild:
	docker-compose build myfuncondaproject-build

drun:
	docker-compose up myfuncondaproject-build


build:
	docker-compose build myfuncondaproject

up:
	docker-compose up myfuncondaproject


exec:
	docker-compose up -d myfuncondaproject && docker exec -it myfuncondaproject bash

kill:
	docker