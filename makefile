include $(PQ_FACTORY)/factory.mk

pq_module_name := gmp-6.0.0
pq_module_file := $(pq_module_name)a.tar.bz2

build-stamp: stage-stamp
	$(MAKE) -C $(pq_module_name)
	$(MAKE) -C $(pq_module_name) check
	$(MAKE) -C $(pq_module_name) install DESTDIR=$(stage_dir)
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	cd $(pq_module_name) && ./configure --prefix=$(part_dir)
	touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp:
	tar jxf $(source_dir)/$(pq_module_file) && touch $@

