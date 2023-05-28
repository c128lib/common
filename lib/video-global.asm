/*
  @file video.asm
  @brief Video module
  @details Macros for video management by using Kernal routines.
 
  @copyright MIT Licensed
  @date 2022
*/

#importonce
.filenamespace c128lib

/**
  Move cursor to specified coordinates inside current screen. Can be used
  on 40 columns or 80 columns screen.

  @param xPos x position on screen
  @param yPos y position on screen
  @remark Registers .X and .Y will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_MoveCursor(xPos, yPos) { MoveCursor(xPos, yPos) }

/**
  Prints string in current cursor position. Can be used
  on 40 columns or 80 columns screen.

  @param stringAddress Address of string to print
  @remark Registers .A and .X will be modified.
  Flags N, Z and C will be affected.

  @note String should be null termineted. If not, it will
  stop after 255 chars.

  @since 0.6.0
*/
.macro @c128lib_PrintString(string) { PrintString(string) }

/**
  Prints string in current cursor position with specified
  length, no matter if string is null terminated.

  @param stringAddress Address of string to print
  @param length Length of the string
  @remark Registers .A and .X will be modified.
  Flags N, Z and C will be affected.

  @since 0.6.0
*/
.macro @c128lib_PrintStringWithLength(string, length) { PrintStringWithLength(string, length) }

#import "video.asm"
