/**
  @file math-global.asm
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

  @param value first addend
  @param dest memory location for second addend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_add16(value, dest) { add16(value, dest) }

/**
  Adds 16 bit number value to given memory cell specified by dest address
  and set result to dest.

  @param value first addend
  @param dest memory location for second addend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.pseudocommand @c128lib_add16 value : low { add16 value : low }

/**
  Subtracts 16 bit number value from given memory cell specified by low address
  and set result to low.

  @param value subtracting
  @param dest memory location for minuend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_sub16(value, low) { sub16(value, low) }
.macro @c128lib_addMem16(source, destination) { addMem16(source, destination ) }

/**
  Subtracts value from "source" memory location from value in "destination"
  memory location.

  @param[in] source subtracting
  @param[inout] dest memory location for minuend and result
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.

  @since 0.7.0
*/
.macro @c128lib_subMem16(source, destination) { subMem16(source, destination)}

/**
  Shifts left 2 byte number specified with address. Carry flag indicates
  last bit that has been "shifted out".

  @param address address to shift
  Flag C will be affected.

  @since 0.6.0
*/
.macro @c128lib_asl16(address) { asl16(address) }

/**
  Increments 16 bit number located in memory address starting from "destination".

  @param address address to shift
  @remark Register .A will be modified.
  Flags N and Z will be affected.

  @since 0.6.0
*/
.macro @c128lib_inc16(destination) { inc16(destination) }

/**
  Decrements 16 bit number located in memory address starting from
  "destination".

  @param destination memory address to decrement
  @remark Register .A will be modified.
  Flags N, Z and C will be affected.
*/
.macro @c128lib_dec16(destination) { dec16(destination) }

/**
  Multiplies left times right. Target value will be added to the value
  stored in targetAddr.

  @param left first factor
  @param dest second factor
  @param targetAddr adding value and result
  @remark Registers .A and .X will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_mulAndAdd(left, right, targetAddr) { mulAndAdd(left, right, targetAddr) }

/**
  Divides the two-byte number dividend by the two-byte number divisor,
  leaving the quotient in dividend and the remainder in remainder.
  Addressing mode of 16-bit numbers uses little endian. 

  @param dividend dividend and also quotient
  @param divisor divisor
  @param remainder remainder (wide as divisor)
  @remark Registers .A, .X and .Y will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_div16By16(dividend, divisor, remainder) { div16By16(dividend, divisor, remainder) }

/**
  Divides the two-byte number dividend by the one-byte number divisor,
  leaving the quotient in dividend and the remainder in remainder.
  Addressing mode of 16-bit numbers uses little endian.

  @param dividend dividend and also quotient
  @param divisor divisor
  @param remainder remainder (wide as divisor)
  @remark Registers .A, .X and .Y will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_div16By8(dividend, divisor, remainder) { div16By8(dividend, divisor, remainder) }

#import "math.asm"
