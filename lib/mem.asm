#import "invoke.asm"
#import "math.asm"
#importonce
.filenamespace c128lib

/*
 * MMU (mirrored from $d500)
 */
.const MMUCR		    = $ff00 	// bank configuration register
.const PCRA 		    = $ff01 	// preconfig register A
.const PCRB 		    = $ff02 	// preconfig register B
.const PCRC 		    = $ff03 	// preconfig register C
.const PCRD 		    = $ff04 	// preconfig register D
.const MMUMCR		    = $ff05 	// cpu mode configuration register
.const MMURCR 		  = $ff06 	// ram configuration register

/*
 * MOS 8502 Vector table constants.
 */
.label NMI_LO       = $FFFA
.label NMI_HI       = $FFFB
.label RESET_LO     = $FFFC
.label RESET_HI     = $FFFD
.label IRQ_LO       = $FFFE
.label IRQ_HI       = $FFFF

/*----------------------------------------------------------
 Banking, RAM configurations

 bits:
 0:   $d000-$dfff (i/o block, ram or rom)
 1:   $4000-$7fff (lower basic rom)
 2-3: $8000-$bfff (upper basic rom, monitor, internal/external ROM)
 4-5: $c000-$ffff (char ROM, kernal, internal/external ROM, RAM)
 6:   select RAM block

 Setting a bit means RAM, clearing means ROM.
 Use the BASIC Bank configuration numbers.

 Syntax:		:SetBankConfiguration(number)
----------------------------------------------------------*/
.macro SetBankConfiguration(id) {
	.if(id==0) {
		lda #%00111111 	// no roms, RAM 0
	}
	.if(id==1) {
		lda #%01111111 	// no roms, RAM 1
	}
	.if(id==12) {
		lda #%00000110 	// internal function ROM, Kernal and IO, RAM 0
	}
	.if(id==14) {
		lda #%00000001 	// all roms, char ROM, RAM 0
	}
	.if(id==15) {
		lda #%00000000  // all roms, RAM 0. default setting.
	}
	.if(id==99) {
		lda #%00001110  // IO, kernal, RAM0. No basic,48K RAM.
	}
	sta MMUCR
}

/*----------------------------------------------------------
Configure common RAM amount.

RAM Bank 0 is always the visible RAM bank.
Valid values are 1,4,8 and 16.

Syntax:		:SetCommonRAM(1)
----------------------------------------------------------*/
.macro SetCommonRAM(amount) {
	lda MMURCR
	and #%11111100 			// clear bits 0 and 1. this is also option 1
	.if(amount==4) {
		ora #%00000001
	}
	.if(amount==8) {
		ora #%00000010
	}
	.if(amount==16) {
		ora #%00000011
	}
	sta MMURCR
}

/*----------------------------------------------------------
Configure where common RAM is enabled. Top, bottom, or both.
Valid options are 1, 2 or 3.
1 = bottom (default)
2 = top
3 = bottom and top

Syntax:		:SetCommonEnabled(1)
----------------------------------------------------------*/
.macro SetCommonEnabled(option) {
	lda MMURCR
	and #%11110011 			// clear bits 2 and 3
	ora #option*4
	sta MMURCR
}

/*
 * Copies "count" bytes from memory location starting in "source" to memory location starting from "destination".
 *
 * MOD: A
 */
.macro copyFast(source, destination, count) {
  .for(var i = 0; i < count; i++) {
    lda source + i
    sta destination + i
  }
}
.assert "copyFast($A000, $B000, 0) copies nothing", { :copyFast($A000, $B000, 0) }, {}
.assert "copyFast($A000, $B000, 1) copies one byte", { :copyFast($A000, $B000, 1) }, {
  lda $A000; sta $B000
}
.assert "copyFast($A000, $B000, 2) copies two bytes", { :copyFast($A000, $B000, 2) }, {
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

/*
 * Fills 1kb of memory (screen) starting from "address" with given "value".
 *
 * MOD: A, X
 */
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

/*
 * Fills byte located in memory address "mem" with byte "value".
 *
 * MOD: A
 */
.macro set8(value, mem) {
  set8 #value : mem
}

.pseudocommand set8 value : mem {
  lda value
  sta mem
}

/*
 * Fills word located in memory address "mem" with byte "value".
 *
 * MOD: A
 */
.macro set16(value, mem) {
  :set8(<value, mem)
  :set8(>value, mem + 1)
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
