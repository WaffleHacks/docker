MAKEFILES=dns

.PHONY: all
all: dns

.PHONY: dns
dns:
	make -C dns all

.PHONY: clean
clean:
	for project in ${MAKEFILES}; do \
		make -C $$project clean; \
	done
