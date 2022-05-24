# Makefile to build, simulate and run all of the benchmarks

subdirs := bubblesort LPF128 pedometer128 schlieren128 

.PHONY: all $(subdirs)

all: $(subdirs)

# rebuld and run every benchmark on sf
$(subdirs):
	$(MAKE) clean -C $@
	$(MAKE) -C $@
	cd $@ && sf run.m
	cp $@/sunflower.out $@.out

clean: 
	$(RM) *.out
