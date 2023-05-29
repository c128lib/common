/**
 * @brief Memory module
 * @details Macros for memory management
 *
 * @copyright MIT Licensed
 * @date 2022
 */

#importonce
.filenamespace c128lib

/** Non-maskable interrupt vector lo-address
*/
.label NMI_LO       = $fffa
/** Non-maskable interrupt vector hi-address
*/
.label NMI_HI       = $fffb
/** Cold reset vector lo-address
*/
.label RESET_LO     = $fffc
/** Cold reset vector hi-address
*/
.label RESET_HI     = $fffd
/** Interrupt service routine vector lo-address
*/
.label IRQ_LO       = $fffe
/** Interrupt service routine vector hi-address
*/
.label IRQ_HI       = $ffff

/**
  Copies some bytes from starting memory location todestination memory location.

  @param source Starting address
  @param destination Destination address
  @param count Number of byte to copy

  @remark Register .A will be modified
  @note Be aware when using big value for count because
  resulting code will be huge.
  @note Use c128lib_copyFast in mem-global.asm

  @since 0.6.0
*/
.macro copyFast(source, destination, count) {
  .for(var i = 0; i < count; i++) {
    lda source + i
    sta destination + i
  }
}
.assert "copyFast($A000, $B000, 0) copies nothing", { copyFast($A000, $B000, 0) }, {}
.assert "copyFast($A000, $B000, 1) copies one byte", { copyFast($A000, $B000, 1) }, {
  lda $A000; sta $B000
}
.assert "copyFast($A000, $B000, 2) copies two bytes", { copyFast($A000, $B000, 2) }, {
  lda $A000; sta $B000
  lda $A001; sta $B001
}

.pseudocommand copy16 source:destination {
  lda source
  sta destination
  lda incArgument(source)
  sta incArgument(destination)
}

.pseudocommand copy8 source:destination {
  lda source
  sta destination
}

.macro fillScreen(address, value) {
  lda #value
  ldx #$00
  loop:
    sta address, x
    sta address + $0100, x
    sta address + $0200, x
    sta address + $0300, x
    inx
  bne loop
}

.macro set8(value, address) {
  set8 #value : address
}

.pseudocommand set8 value : address {
  lda value
  sta address
}

/**
  Fills two-byte located in memory address "mem" with byte "value".

  @param value value to set on specified address
  @param address address to set
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @note Use c128lib_set16 in mem-global.asm

  @since 0.6.0
*/
.macro set16(value, address) {
  set8(<value, address)
  set8(>value, address + 1)
}
.assert "set16($1234, $A000) stores $34 under $A000 and $12 under $A001", { :set16($3412, $A000) }, {
  lda #$12
  sta $A000
  lda #$34
  sta $A001
}

.macro copyWordIndirect(source, destinationPointer) {
  ldy #0
  lda source
  sta (destinationPointer), y
  iny
  lda source + 1
  sta (destinationPointer), y
}

.macro cmp16(value, low) {
  lda #<value
  cmp low
  bne end
  lda #>value
  cmp low + 1
end:
}

.macro rotateMemRightFast(startPtr, count) {
  lda startPtr
  pha

  .for(var i = 0; i < count - 1; i++) {
    lda startPtr + i + 1
    sta startPtr + i
  }

  pla
  sta startPtr + count - 1
}
.assert "rotateMemRightFast($A000, 1) does (almost) nothing", { rotateMemRightFast($A000, 1) }, {
  lda $A000; pha
  pla; sta $A000
}
.assert "rotateMemRightFast($A000, 2) swaps values", { rotateMemRightFast($A000, 2) }, {
  lda $A000; pha
  lda $A001
  sta $A000
  pla; sta $A001
}
.assert "rotateMemRightFast($A000, 3) rotates 3 values", { rotateMemRightFast($A000, 3) }, {
  lda $A000; pha
  lda $A001
  sta $A000
  lda $A002
  sta $A001
  pla; sta $A002
}
.assert "rotateMemRightFast($A000, 7) rotates 7 values", { rotateMemRightFast($A000, 7) }, {
  lda $A000; pha
  lda $A001
  sta $A000
  lda $A002
  sta $A001
  lda $A003
  sta $A002
  lda $A004
  sta $A003
  lda $A005
  sta $A004
  lda $A006
  sta $A005
  pla; sta $A006
}

#import "invoke.asm"
#import "math.asm"
