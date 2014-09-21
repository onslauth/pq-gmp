include $(PQ_FACTORY)/factory.mk

pq_module_name := gmp-4.3.2
pq_module_file := $(pq_module_name).tar.bz2

build: build-stamp
build-stamp: stage-stamp
	(cd $(pq_module_name) && $(MAKE)) && touch $@

stage-stamp: configure-stamp

configure: configure-stamp
configure-stamp: unpack-stamp
	(cd $(pq_module_name) && ./configure --prefix=$(part_dir)) && touch $@

unpack: unpack-stamp
unpack-stamp:
	tar jxf $(source_dir)/$(pq_module_file) && touch $@
