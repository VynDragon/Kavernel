#ifndef _ATMEGA2560_H_
#define _ATMEGA2560_H_

// to be compiled with avr-gcc

#define NO_MMU

/* START and END in WORD
 * WORD in bytes
 */

// Internal RAM
#define RAM_START       0x200
#define RAM_END         0x21FF
#define RAM_START_LOW   0x0
#define RAM_END_LOW     0xFF
#define RAM_START_HIGH  0x2
#define RAM_END_HIGH    0x21

#define RAM_WORD        0x1

// EEPROM
#define EEPROM_START    0x0
#define EEPROM_END      0xFFF
#define EEPROM_WORD     0x1

// Flash memory
#define FLASH_START     0x0
#define FLASH_END       0x1FFFF
#define FLASH_WORD      0x2

// C only part
#ifndef __ASSEMBLER__

// type definition
typedef char                int8_t;
typedef unsigned char       uint8_t;
typedef int                 int16_t;
typedef unsigned int        uint16_t;
typedef long                int32_t;
typedef unsigned long       uint32_t;
typedef long                int32_t;
typedef unsigned long       uint32_t;
typedef long long           int64_t;
typedef unsigned long long  uint64_t;
typedef float               float_t;
#define double_t #warning "double_t not supported and replaced with float_t" float_t

#endif

#endif /* _ATMEGA2560_H_ */