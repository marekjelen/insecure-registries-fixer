build:
	docker build -t mjelen/insecure-registries-fixer .

run: build
	docker run -ti --rm --name irf mjelen/insecure-registries-fixer

push: build
	docker push mjelen/insecure-registries-fixer