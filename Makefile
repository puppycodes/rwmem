all: rdmem wrmem rdpci

rdmem: rdmem.o DirectHW.o
	$(CC) -o $@ $^ -framework IOKit
wrmem: wrmem.o DirectHW.o
	$(CC) -o $@ $^ -framework IOKit

rdpci: rdpci.o DirectHW.o
	$(CC) -o $@ $^ -framework IOKit

clean:
	$(RM) *.o .*.d rdmem

CFLAGS = \
	-g \
	-O3 \
	-W \
	-Wall \
	-MMD \
	-MF .$(notdir $@).d

-include .*.d
