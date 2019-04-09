ifneq ($(KERNELRELEASE),)

obj-m := demo_genetlink_kern.o

else

KDIR ?= /lib/modules/$(shell uname -r)/build
userspace_programs += demo_genetlink_user

.PHONY: all
all: modules $(userspace_programs)

.PHONY: modules
modules:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

.PHONY: clean
clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	$(RM) *.ko *.o *.mod.o *.mod.c *.symvers *.order
	$(RM) $(userspace_programs)

endif # ($(KERNELRELEASE),)
