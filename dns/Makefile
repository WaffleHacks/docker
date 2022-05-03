VERSION=v1.9.1

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
	cp plugin.cfg coredns-src/plugin.cfg
	make -C coredns-src LINUX_ARCH=amd64 coredns
	cp coredns-src/coredns ./coredns

coredns-src:
	git clone git@github.com:coredns/coredns.git coredns-src

.PHONY: clean
clean:
	rm -rf coredns coredns-src
	docker image rm -f wafflehacks/dns:latest wafflehacks/dns:${VERSION}
