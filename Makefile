ARCH=avr
CPU=atmega2560

ifeq ($(ARCH), avr)
MMCU=$(CPU)
CC=avr-gcc -mmcu=$(MMCU)
CFLAGS= -D CPU_$(CPU) 
endif

INCLUDE=./include
# you actually NEED -O2
CFLAGS=-W -Wall -O2 -I$(INCLUDE) $(CFLAGS)
LDFLAGS= $(LDFLAGS)
EXEC=kernel

SRC= 

OBJ= $(SRC:.c=.o)


all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)


.PHONY: clean rmproper re hex upload

clean:
	@rm -rf $(OBJ)

rmproper: clean
	@rm -rf $(EXEC)

re: clean rmproper all

hex:
	avr-objcopy -j .text -j .data -O ihex $(EXEC) $(EXEC).hex
upload:
	sudo avrdude -V -v -D -p $(MMCU) -P /dev/ttyACM0 -c stk500v2 -U flash:w:$(EXEC).hex