
PREFIX = h8300-elf

CROSS_CC = $(PREFIX)-gcc
CROSS_AS = $(PREFIX)-as
CROSS_LD = $(PREFIX)-ld
CROSS_OBJCOPY = $(PREFIX)-objcopy
CROSS_SIZE = $(PREFIX)-size

CROSS_CFLAGS = -mh
CROSS_LDFLAGS = -T h8rom.ld -nostartfiles -nostdinc -nostdlib 

OBJS=h8crt0.o main.o

block.mot:	blink.elf
	$(CROSS_OBJCOPY) blink.elf -O srec $@

blink.elf:	$(OBJS)
	$(CROSS_CC) $(CROSS_LDFLAGS) -o $@ $(OBJS)

.c.o:
	$(CROSS_CC) $(CROSS_CFLAGS) -c $<

h8crt0.o:	h8crt0.s
	$(CROSS_CC) $(ASDEF) -c h8crt0.s

clean:
	rm -rf *.o *.elf *.mot
