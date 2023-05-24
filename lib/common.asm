/**
  @file common.asm
  @brief Common module
  @details Macros for starting a new program and other common functions.

  @copyright MIT Licensed
  @date 2022
*/

#importonce
.filenamespace c128lib

/**
  BasicUpstart for C128, creates a basic program that sys' the address

  @param address Address to use with SYS command

  @note Use c128lib_BasicUpstart128 in common-global

  @since 0.6.0
*/
.macro BasicUpstart128(address) {
    .pc = $1c01 "C128 Basic"
    .word upstartEnd  // link address
    .word 10   // line num
    .byte $9e  // sys
    .text toIntString(address)
    .byte 0
upstartEnd:
    .word 0  // empty link signals the end of the program
    .pc = $1c0e "Basic End"
}

/**
  Generates the negative value for the argument

  @param value Value to negated

  @since 0.6.0
*/
.function neg(value) {
  .return value ^ $FF
}
.assert "neg($00) gives $FF", neg($00), $FF
.assert "neg($FF) gives $00", neg($FF), $00
.assert "neg(%10101010) gives %01010101", neg(%10101010), %01010101

/**
  Increases argument by one preserving its type (addressing mode).
  To be used in pseudocommands.

  @param arg Argument to be incremented

  @since 0.6.0
*/
.function incArgument(arg) {
  .return CmdArgument(arg.getType(), arg.getValue() + 1)
}

/**
  Improved BNE instruction to use far branch.

  @param label Address to reach if jump is needed

  @note Use c128lib_fbne in common-global

  @since 0.6.0
 */
.macro fbne(label) {
  here: // we have to add 2 to "here", because relative jump is counted right after bne xx, and this instruction takes 2 bytes
    .if (here > label) {
      // jump back
      .if (here + 2 - label <= 128) {
        bne label
      } else {
        beq skip
        jmp label
      skip:
      }
    } else {
      // jump forward
      .if (label - here - 2 <= 127) {
        bne label
      } else {
        beq skip
        jmp label
      skip:
      }
    }
}

/**
  Improved BMI instruction to use far branch.

  @param label Address to reach if jump is needed

  @note Use c128lib_fbmi in common-global

  @since 0.6.0
 */
.macro fbmi(label) {
  here: // we have to add 2 to "here", because relative jump is counted right after bne xx, and this instruction takes 2 bytes
    .if (here > label) {
      // jump back
      .if (here + 2 - label <= 128) {
        bmi label
      } else {
        bpl skip
        beq skip
        jmp label
      skip:
      }
    } else {
      // jump forward
      .if (label - here - 2 <= 127) {
        bmi label
      } else {
        bpl skip
        beq skip
        jmp label
      skip:
      }
    }
}

/**
  Convert kbytes to bytes.

  @param value Value in Kib to be converted

  @since 0.6.0
 */
.function toBytes(value) {
  .return value * 1024
}

.function convertHires(data) {
  .var result = ""
  .for(var i = 0; i < data.size(); i++) {
    .var ch = data.charAt(i)
    .if (ch == '.') {
      .eval result = result + '0'
    } else {
      .eval result = result + '1'
    }
  }
  .return result.asNumber(2)
}
.assert @"convertHires(\"........\") = 0", convertHires("........"), 0
.assert @"convertHires(\".......#\") = 1", convertHires(".......#"), 1
.assert @"convertHires(\"########\") = 255", convertHires("########"), 255

.function convertMultic(data) {
  .var result = ""
  .for(var i = 0; i < data.size(); i++) {
    .var ch = data.charAt(i)
    .if (ch == '.') .eval result = result + "00"
    .if (ch == '#') .eval result = result + "11"
    .if (ch == '+') .eval result = result + "01"
    .if (ch == 'o') .eval result = result + "10"
  }
  .return result.asNumber(2)
}
.assert @"convertMultic(\"....\") = 0", convertMultic("...."), 0
.assert @"convertMultic(\"...#\") = 3", convertMultic("...#"), 3
.assert @"convertMultic(\"####\") = 255", convertMultic("####"), 255

.macro ch(data) {
  .byte convertHires(data.substring(0, 8))
}

.macro cm(data) {
  .byte convertMultic(data.substring(0, 4))
}
