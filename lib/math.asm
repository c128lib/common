/**
  @file math.asm
  @brief Math module
  @details Macros for math.
 
  @copyright MIT Licensed
  @date 2022
*/
 
#importonce
.filenamespace c128lib

/**
  Adds 16 bit number value to given memory cell specified by dest address
  and set result to dest.

  @param[in] value first addend
  @param[inout] dest memory location for second addend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_add16 in math-global.asm

  @since 0.6.0
*/
.macro add16(value, dest) {
  clc
  lda dest
  adc #<value
  sta dest
  lda dest + 1
  adc #>value
  sta dest + 1
}
.assert "add16($0102, $A000) ", { add16($0102, $A000) }, {
  clc; lda $A000; adc #$02; sta $A000
  lda $A001; adc #$01; sta $A001
}

/**
  Subtracts 16 bit number value from given memory cell specified by dest address
  and set result to dest.

  @param[in] value subtracting
  @param[inout] dest memory location for minuend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_sub16 in math-global.asm

  @since 0.6.0
*/
.macro sub16(value, dest) {
  sec
  lda dest
  sbc #<value
  sta dest
  lda dest + 1
  sbc #>value
  sta dest + 1
}
.assert "sub16($0102, $A000)", { sub16($0102, $A000) }, {
  sec; lda $A000; sbc #$02; sta $A000
  lda $A001; sbc #$01; sta $A001
}
.assert "sub16(256, $A000)", { sub16(256, $A000) }, {
  sec; lda $A000; sbc #0; sta $A000
  lda $A001; sbc #1; sta $A001
}

/**
  Adds value from "source" memory location to value in "destination"
  memory location.

  @param[in] source first addend
  @param[inout] dest memory location for second addend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_sub16 in math-global.asm

  @since 0.6.0
*/
.macro addMem16(source, destination) {
  add16 source:destination
}
.assert "addMem16($A000, $B000)", { addMem16($A000, $B000) }, {
  clc; lda $A000; adc $B000; sta $B000
  lda $A001; adc $B001; sta $B001
}

.pseudocommand add16 source : destination {
  clc
  lda source
  adc destination
  sta destination
  lda incArgument(source)
  adc incArgument(destination)
  sta incArgument(destination)
}

/**
  Subtracts value from "source" memory location from value in "destination"
  memory location.

  @param[in] source subtracting
  @param[inout] dest memory location for minuend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro subMem16(source, destination) {
  sub16 source : destination
}
.assert "subMem16($A000, $B000)", { subMem16($A000, $B000) }, {
  sec; lda $B000; sbc $A000; sta $B000
  lda $B001; sbc $A001; sta $B001
}

/**
  Subtracts value from "source" memory location from value in "destination"
  memory location.

  MOD: A, C
*/
.pseudocommand sub16 source : destination {
  sec
  lda destination
  sbc source
  sta destination
  lda incArgument(destination)
  sbc incArgument(source)
  sta incArgument(destination)
}

/**
  Shifts left 2 byte number specified with address. Carry flag indicates
  last bit that has been "shifted out".

  @param[inout] value address to shift
  @remark Register .A will be modified.
  Flag C will be affected.

  @note Use c128lib_asl16 in math-global.asm

  @since 0.6.0
*/
.macro asl16(value) {
  asl16 value
}

/** 
  Shifts left 2 byte number specified with "low" address. Carry flag indicates last bit that has been "shifted out".

  MOD: A, C
*/
.pseudocommand asl16 low {
  clc
  asl low
  bcc !+
  lda incArgument(low)
  asl
  ora #%1
  sta incArgument(low)
!:
}

/**
  Increments 16 bit number located in memory address starting from "destination".

  @param[inout] address address to shift
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @note Use c128lib_asl16 in math-global.asm

  @since 0.6.0
*/
.macro inc16(address) {
  inc16 address
}

/**
  Increments 16 bit number located in memory address starting from "destination".

  @param[inout] address address to shift
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @since 0.6.0
*/
.pseudocommand inc16 address {
  inc address
  bne !+
  inc incArgument(address)
!:
}

/**
  Decrements 16 bit number located in memory address starting from "destination".

  @param[inout] address address to shift
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @note Use c128lib_dec16 in math-global

  @since 0.6.0
*/
.macro dec16(destination) {
  dec16 destination
}

/**
  Decrements 16 bit number located in memory address starting from "destination".

  @param[inout] address address to shift
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @since 0.6.0
*/
.pseudocommand dec16 destination {
  dec destination
  lda destination
  cmp #$ff
  bne !+
  dec incArgument(destination)
!:
}

/**
  Multiplies left times right. Target value will be added to the value
  stored in targetAddr.

  @param[in] left first factor
  @param[in] dest second factor
  @param[inout] targetAddr adding value and result
  @remark Registers .A and .X will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_mulAndAdd in math-global.asm

  @since 0.6.0
*/
.macro mulAndAdd(left, right, targetAddr) {
    ldx #right
  !:
    clc
    lda #left
    adc targetAddr
    sta targetAddr
    lda #0
    adc targetAddr + 1
    sta targetAddr + 1
    dex
    bne !-
}

/**
  Divides the two-byte number dividend by the two-byte number divisor,
  leaving the quotient in dividend and the remainder in remainder.
  Addressing mode of 16-bit numbers uses little endian. 

  @param[inout] dividend dividend and also quotient
  @param[in] divisor divisor
  @param[out] remainder remainder (wide as divisor)
  @remark Registers .A, .X and .Y will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_div16By16 in math-global

  @since 0.6.0
*/
.macro div16By16(dividend, divisor, remainder) {
    lda #0          
    sta remainder     // Initialize remainder to 0.
    sta remainder+1
    ldx #16           // There are 16 bits in the dividend

  loop1:
    /* Shift the hi bit of dividend into remainder */
    asl dividend     
    rol dividend+1   
    rol remainder    
    rol remainder+1

    /* Trial subtraction */  
    lda remainder
    sec
    sbc divisor
    tay
    lda remainder+1
    sbc divisor+1

    /* Check subtraction */
    bcc loop2             // Did subtraction succeed?
    sta remainder+1       // If yes, save it, else loop2
    sty remainder
    inc dividend          // and record a 1 in the quotient

  loop2:
    dex
    bne loop1
}

/**
  Divides the two-byte number dividend by the one-byte number divisor,
  leaving the quotient in dividend and the remainder in remainder.
  Addressing mode of 16-bit numbers uses little endian.

  @param[inout] dividend dividend and also quotient
  @param[in] divisor divisor
  @param[out] remainder remainder (wide as divisor)
  @remark Registers .A, .X and .Y will be modified.
  Flags N, Z and C will be affected.

  @note Use c128lib_div16By8 in math-global

  @since 0.6.0
*/
.macro div16By8(dividend, divisor, remainder) {
    lda #0          
    sta remainder     // Initialize remainder to 0.
    ldx #16           // There are 16 bits in the dividend
  loop1:
    /* Shift the hi bit of dividend into remainder */
    asl dividend     
    rol dividend+1   
    rol remainder    

    /* Trial subtraction */  
    lda remainder
    sec
    sbc divisor

    /* Check subtraction */
    bcc loop2             // Did subtraction succeed?
    sta remainder         // If yes, save it, else loop2
    inc dividend          // and record a 1 in the quotient

  loop2:
    dex
    bne loop1
}

#import "common.asm"
