TREEROOT	= ../../../../../
include $(TREEROOT)/tools/sunflower/conf/setup.conf

TARGET-ARCH	= riscv32-elf
TARGET		= riscv

PROGRAM		= softwareblink
INIT		= init

OPTFLAGS	= -g -O0
CFLAGS		= -march=rv32i -mabi=ilp32 $(TARGET-ARCH-FLAGS) -Wall 
ASFLAGS		= -march=rv32i -mabi=ilp32
LDFLAGS		= -L$(TOOLSLIB)/$(TARGET) -Map $(PROGRAM).map -Tsail.ld	#-Ttext $(LOADADDR)
LOADADDR	= 0x00
SREC2HEX	= srec2hex

OBJS	=\
	$(PROGRAM).o\


all:	$(PROGRAM) $(PROGRAM).sr Makefile

$(INIT).o: $(INIT).S
	$(CC) $(ASFLAGS) -O0 -c -o $(INIT).o $(INIT).S

$(PROGRAM): $(OBJS) $(INIT).o
	$(LD) $(LDFLAGS) $(INIT).o $(OBJS) -o $@ -lc -lm -lgcc

$(PROGRAM).sr:$(PROGRAM)
	$(OBJCOPY) -O srec $(PROGRAM) $@

$(PROGRAM).o: $(PROGRAM).c Makefile
	$(CC) $(CFLAGS) $(OPTFLAGS) -c $(PROGRAM).c

install: all
	$(SREC2HEX) $(PROGRAM).sr
	cp program.hex ../../programs
	cp data.hex ../../programs

clean:
	$(RM) init.i *.o $(PROGRAM) $(PROGRAM).sr $(PROGRAM).map
