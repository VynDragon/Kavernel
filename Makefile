ARCH=		avr
CPU=		atmega2560

ifeq ($(ARCH), avr)
MMCU=		$(CPU)
CC=		avr-gcc -mmcu=$(MMCU)
CFLAGS=		-D CPU_$(CPU) 
endif

INCLUDE=	./include
# you actually NEED -O2
CFLAGS:=	-nostdlib -nodefaultlibs -nostartfiles -W -Wall -O2 -I$(INCLUDE) $(CFLAGS)
LDFLAGS:=	$(LDFLAGS)
EXEC=		output

SRC=		kernel/init.S

SRC_ASM=	$(filter %.S,$(SRC))

SRC_C=		$(filter %.c,$(SRC))

$(info SRC_C is [${SRC_C}])

$(info SRC_ASM is [${SRC_ASM}])

PREPPED_ASM=	$(SRC_ASM:.S=.s)

OBJ_ASM=	$(PREPPED_ASM:.s=.o)

OBJ_C= 		$(SRC_C:.c=.o)

$(info OBJ_C is [${OBJ_C}])

$(info OBJ_ASM is [${OBJ_ASM}])

OBJ=		$(OBJ_ASM) $(OBJ_C)

$(info OBJ is [${OBJ}])


all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(CFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)
%.o: %.S
	$(CC) -o $@ -c $< $(CFLAGS)


.PHONY: clean rmproper re hex upload

clean:
	@rm -rf $(OBJ)
	@rm -rf $(PREPPED_ASM)

rmproper:
	@rm -rf $(EXEC)

re: clean rmproper all

hex:
	avr-objcopy -j .text -j .data -O ihex $(EXEC) $(EXEC).hex
upload:
	sudo avrdude -V -v -D -p $(MMCU) -P /dev/ttyACM1 -c stk500v2 -U flash:w:$(EXEC).hex