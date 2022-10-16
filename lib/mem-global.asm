#import "mem.asm"
#importonce
.filenamespace c128lib

.macro @c128lib_copyFast(source, destination, count) { copyFast(source, destination, count) }
.macro @c128lib_fillScreen(address, value) { fillScreen(address, value) }
.macro @c128lib_set8(value, mem) { set8(value, mem) }
.pseudocommand @c128lib_set8 value : mem { set8 value : mem }
.macro @c128lib_set16(value, mem) { set16(value, mem) }
.macro @c128lib_copyWordIndirect(source, destinationPointer) { copyWordIndirect(source, destinationPointer) }
.macro @c128lib_cmp16(value, low) { cmp16(value, low) } 
.macro @c128lib_rotateMemRightFast(startPtr, count) { rotateMemRightFast(startPtr, count) }
