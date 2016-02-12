MMCU=atmega2560
CC=avr-gcc -mmcu=$(MMCU)
# you actually NEED -O2
CFLAGS=-W -Wall -O2
LDFLAGS=
EXEC=test
SRC= test.c
OBJ= $(SRC:.c=.o)


all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)


.PHONY: clean rmproper

clean:
	@rm -rf $(OBJ)

rmproper: clean
	@rm -rf $(EXEC)

re: clean rmproper all

hex:
	avr-objcopy -j .text -j .data -O ihex $(EXEC) $(EXEC).hex
upload:
	sudo avrdude -V -v -D -p $(MMCU) -P /dev/ttyACM0 -c stk500v2 -U flash:w:$(EXEC).hex