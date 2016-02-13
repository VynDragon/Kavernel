#IFNDEF _ATMEGA2560_H_
#DEFINE _ATMEGA2560_H_

// to be compiled with avr-gcc

#DEFINE NO_MMU



/* START and END in WORD
 * WORD in bytes
 */

// Internal RAM
#DEFINE RAM_START       0x200
#DEFINE RAM_END         0x21FF
#DEFINE RAM_WORD        0x1

// EEPROM
#DEFINE EEPROM_START    0x0
#DEFINE EEPROM_END      0xFFF
#DEFINE EEPROM_WORD     0x1

// Flash memory
#DEFINE FLASH_START     0x0
#DEFINE FLASH_END       0x1FFFF
#DEFINE FLASH_WORD      0x2

// type definition

typedef char                int8_t
typedef unsigned char       uint8_t
typedef int                 int16_t
typedef unsigned int        uint16_t
typedef long                int32_t
typedef unsigned long       uint32_t
typedef long                int32_t
typedef unsigned long       uint32_t
typedef long long           int64_t
typedef unsigned long long  uint64_t
typedef float               float_t
#define double_t #warning "double_t not supported and replaced with float_t" float_t

#ENDIF /* _ATMEGA2560_H_ */