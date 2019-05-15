TREEROOT	= ../../../../../
include $(TREEROOT)/tools/sunflower/conf/setup.conf

PROGRAM		= softwareblink
INIT		= init

OPTFLAGS	= -g -O0
CFLAGS		= $(TARGET-ARCH-FLAGS) -Wall 
LDFLAGS		= -L$(TOOLSLIB)/$(TARGET) -Map $(PROGRAM).map -Tsail.ld	#-Ttext $(LOADADDR)
LOADADDR	= 0x00
SREC2HEX	= $(TREEROOT)/tools/srec2hex/srec2hex

OBJS	=\
	$(PROGRAM).o\


all:	$(PROGRAM) $(PROGRAM).sr Makefile

$(INIT).o: $(INIT).S
	$(CC) -O0 -c -o $(INIT).o $(INIT).s

$(PROGRAM): $(OBJS) $(INIT).o
	$(LD) $(LDFLAGS) $(INIT).o $(OBJS) -o $@ -lc -lm

$(PROGRAM).sr:$(PROGRAM)
	$(OBJCOPY) -O srec $(PROGRAM) $@

$(PROGRAM).o: $(PROGRAM).c Makefile
	$(CC) $(CFLAGS) $(OPTFLAGS) -c $(PROGRAM).c

install:
	$(SREC2HEX) led.sr
	cp program.hex ../../programs
	cp data.hex ../../programs

clean:
	$(RM) init.i *.o $(PROGRAM) $(PROGRAM).sr $(PROGRAM).map
