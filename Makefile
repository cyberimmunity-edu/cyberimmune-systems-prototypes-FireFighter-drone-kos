d-build:
	docker build ./ -t kos:1.1.1.40

develop:
	docker run --net=host --volume="`pwd`:/data" -it --rm kos:1.1.1.40 bash


build:
	./cross-build.sh

sim:
	./cross-build-sim.sh

clean:
	rm -rf build