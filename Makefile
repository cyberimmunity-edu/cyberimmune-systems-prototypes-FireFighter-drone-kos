d-build:
	docker build ./ -t kos:1.2.0.45

develop:
	docker run --net=host --volume="`pwd`:/data" -it --rm kos:1.2.0.45 bash


build-cardimg:
	./cross-build.sh

build-sim:
	./cross-build-sim.sh

sim: build-sim

clean-image:
	docker rmi kos:1.2.0.45

clean-code:
	rm -rf build

clean: clean-code clean-image	

rebuild: clean-code build-sim
