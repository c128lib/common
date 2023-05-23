/**
  @file common-global.asm
  @brief Common global module
  @details Source file for exporting macros.

  @copyright MIT Licensed
  @date 2022
*/

#importonce
.filenamespace c128lib

/**
 * BasicUpstart for C128, creates a basic program that sys' the address
 *
 * @param address Address to use with SYS command
 *
 * @since 0.6.0
 */
.macro @c128lib_BasicUpstart128(data) {
  BasicUpstart128(data)
}

/**
  Improved BNE instruction to use far branch.

  @param label Address to reach if jump is needed

  @note If label is not far, then a BNE will be used.

  @since 0.6.0
 */
.macro @c128lib_fbne(label) { fbne(label) }

/**
  Improved BMI instruction to use far branch.

  @param label Address to reach if jump is needed

  @note If label is not far, then a BMI will be used.

  @since 0.6.0
 */
.macro @c128lib_fbmi(label) { fbmi(label) }

.macro @c128lib_ch(data) { ch(data) }
.macro @c128lib_cm(data) { cm(data) }

#import "common.asm"
