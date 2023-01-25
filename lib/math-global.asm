#import "math.asm"
#importonce
.filenamespace c128lib

.macro @c128lib_add16(value, low) { add16(value, low) }
.pseudocommand @c128lib_add16 value : low { add16 value : low }
.macro @c128lib_sub16(value, low) { sub16(value, low) }
.macro @c128lib_addMem16(source, destination) { addMem16(source, destination ) }
.macro @c128lib_asl16(low) { asl16(low) }
.macro @c128lib_inc16(destination) { inc16(destination) }
.macro @c128lib_dec16(destination) { dec16(destination) }
.macro @c128lib_mulAndAdd(left, right, targetAddr) { mulAndAdd(left, right, targetAddr) }
.macro @c128lib_div16By16(dividend, divisor, remainder) { div16By16(dividend, divisor, remainder) }
.macro @c128lib_div16By8(dividend, divisor, remainder) { div16By8(dividend, divisor, remainder) }
