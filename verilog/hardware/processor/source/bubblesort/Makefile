TREEROOT	= /data/f-of-e-tools/tools/sunflower
include $(TREEROOT)/conf/setup.conf

TARGET		= riscv
TARGET-ARCH	= riscv32-elf

PROGRAM		= bsort

PORT		= ../port
LIBOS		= mOS
TOOLSLIB	= $(TREEROOT)/tools/tools-lib
INCLUDES	= -I$(PREFIX)/include -I../port/  -I$(TREEROOT)/sys/include -I$(TREEROOT)/sys/kern/superH -I$(TREEROOT)/benchmarks/include -I$(TREEROOT)/sys/libOS/port
OPTFLAGS	= -O0
CFLAGS		= $(TARGET-ARCH-FLAGS) -march=rv32i -mabi=ilp32 -Wall # Do not do since we are linking mOS for libc implementation:	-nostdlib -fno-builtin 

ASFLAGS		= --march=rv32i --mabi=ilp32
LDFLAGS		= -Ttext $(LOADADDR) -L$(TOOLSLIB)/$(TARGET) -L$(TREEROOT)/sys/libOS/$(LIBOS) -Map $(PROGRAM).map
LOADADDR	= 0x08004000

SREC2HEX = srec2hex
OBJS	=\
	init-$(TARGET).o\
	$(PROGRAM).o\


all:	$(PROGRAM) $(PROGRAM).sr Makefile

$(PROGRAM): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $@ -lprintf -lc -lgcc -lgloss

$(PROGRAM).sr:$(PROGRAM)
	$(OBJCOPY) -O srec $(PROGRAM) $@

$(PROGRAM).o: $(PROGRAM).c Makefile
	$(CC) $(CFLAGS) $(OPTFLAGS) $(INCLUDES) -c $(PROGRAM).c

init-$(TARGET).o: init-$(TARGET).S
	$(CPP) init-$(TARGET).S > init-$(TARGET).i; $(AS) $(ASFLAGS) init-$(TARGET).i -o $@

install: all
	$(SREC2HEX) -b 4096 $(PROGRAM).sr
	cp program.hex ../../programs
	cp data.hex ../../programs

clean:
	$(RM) init.i *.o $(PROGRAM) $(PROGRAM).sr $(PROGRAM).map
	$(RM) init-sf.i *.o $(PROGRAM-SF) $(PROGRAM-SF).sr $(PROGRAM-SF).map
	$(RM) program.hex data.hex