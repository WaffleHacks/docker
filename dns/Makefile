VERSION=v1.9.1
REDIS_PLUGIN=github.com/WaffleHacks/coredns-redis

.PHONY: all
all: build publish

.PHONY: build
build: coredns
	docker build -t wafflehacks/dns:latest .
	docker tag wafflehacks/dns:latest wafflehacks/dns:${VERSION}

.PHONY: publish
publish:
	docker push wafflehacks/dns:latest
	docker push wafflehacks/dns:${VERSION}

coredns: coredns-src
	echo "redis:${REDIS_PLUGIN}" >> coredns-src/plugin.cfg
	make -C coredns-src -f Makefile.release LINUX_ARCH=amd64 build
	cp coredns-src/build/linux/amd64/coredns ./coredns

coredns-src:
	git clone git@github.com:coredns/coredns.git coredns-src

.PHONY: clean
clean:
	rm -rf coredns coredns-src
	docker image rm -f wafflehacks/dns:latest wafflehacks/dns:${VERSION}
