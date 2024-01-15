d-build:
	docker build ./ -t kos:1.2.0.45

develop:
	docker run --net=host --volume="`pwd`:/data" -it --rm kos:1.2.0.45 bash


build:
	./cross-build.sh

sim:
	./cross-build-sim.sh

clean:
	docker rmi kos:1.2.0.45
