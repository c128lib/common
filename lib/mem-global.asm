#importonce
.filenamespace c128lib

/**
  Copies some bytes from starting memory location todestination memory location.

  @param source Starting address
  @param destination Destination address
  @param count Number of byte to copy

  @remark Register .A will be modified
  @note Be aware when using big value for count because
  resulting code will be huge.

  @since 0.6.0
*/
.macro @c128lib_copyFast(source, destination, count) { copyFast(source, destination, count) }

/**
  Fills 1kb of memory (screen) starting from "address" with given "value".

  @param address Starting address
  @param value Value used to fill the memory

  @remark Registers .A and .X will be modified

  @since 0.6.0
*/
.macro @c128lib_fillScreen(address, value) { fillScreen(address, value) }

/**
  Fills byte located in memory address "mem" with byte "value".

  @param value value to set on specified address
  @param address address to set
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @since 0.6.0
*/
.macro @c128lib_set8(value, address) { set8(value, address) }
.pseudocommand @c128lib_set8 value : mem { set8 value : mem }

/**
  Fills two-byte located in memory address "mem" with byte "value".

  @param value value to set on specified address
  @param address address to set
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @since 0.6.0
*/
.macro @c128lib_set16(value, address) { set16(value, address) }
.macro @c128lib_copyWordIndirect(source, destinationPointer) { copyWordIndirect(source, destinationPointer) }
.macro @c128lib_cmp16(value, low) { cmp16(value, low) }
.macro @c128lib_rotateMemRightFast(startPtr, count) { rotateMemRightFast(startPtr, count) }

#import "mem.asm"
