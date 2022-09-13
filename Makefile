cbuild:
	conda-build .

cexport:
	rm environment.yml && conda env export > environment.yml

dbuild:
	docker-compose build

drun:
	docker-compose up