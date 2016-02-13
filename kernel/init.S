#include "arch/arch.h"

.section .text
.global main
main:
    LDI r16, RAM_END_HIGH
    OUT 0x3E, r16
    nop
    LDI r16, RAM_END_LOW
    OUT 0x3D, r16
    nop
    CLR r0
    SBI 0, 7
    OUT 0x4, r0

    IN  r16, 0x5
    nop
    CPI r16,0x0
    BREQ zero
    CLR r16
    OUT 0x5, r16
    call wait
zero:
    SER r16
    OUT 0x5, r16
    call wait

wait:
    ldi r16, 0b00000001
    OUT 0x33, r16
    SLEEP
waitloop: 
    BRLO waitloop
    RET