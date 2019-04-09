ifneq ($(KERNELRELEASE),)

obj-m := demo_genetlink_kern.o

else
	
KDIR ?= /lib/modules/$(shell uname -r)/build

.PHONY: all
all: modules demo_genetlink_user

.PHONY: modules
modules:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

.PHONY: clean
clean:
	$(RM) -f *.ko *.o *.mod.o *.mod.c *.symvers  modul*
	$(RM) -f ./release/*

endif # ($(KERNELRELEASE),)
