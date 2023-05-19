/*
 * @brief Video module
 * @details Macros for video management by using Kernal routines.
 *
 * @copyright MIT Licensed
 * @date 2022
 */
 
#importonce
.filenamespace c128lib

.namespace Video {
}

.macro MoveCursor(xPos, yPos) {
  .errorif (xPos < 0 || yPos < 0), "xPos and yPos must be greather than 0"
  .errorif (xPos > 79), "xPos must be lower than 80"
  .errorif (yPos > 24), "yPos must be lower than 25"
    clc
    ldx #xPos
    ldy #yPos
    jsr c128lib.Kernal.PLOT
}
.asserterror "MoveCursor(-1, 0)", { MoveCursor(-1, 0) }
.asserterror "MoveCursor(0, -1)", { MoveCursor(0, -1) }
.asserterror "MoveCursor(80, 0)", { MoveCursor(80, 0) }
.asserterror "MoveCursor(0, 25)", { MoveCursor(0, 25) }
.assert "MoveCursor(1, 2)", { MoveCursor(1, 2) },
{
  clc; ldx #1; ldy #2; jsr $FFF0
}

.macro PrintString(stringAddress) {
    ldx #0
  !:
    lda stringAddress, x
    beq !Done+
    jsr c128lib.Kernal.BSOUT
    inx
    bne !-
  !Done:
}
.assert "PrintString($beef)", { PrintString($beef) },
{
  ldx #0; lda $beef, x; beq *+8; jsr $ffd2; inx; bne *-9
}

.macro PrintStringWithLength(stringAddress, length) {
  .errorif (length <= 0), "length must be greather than 0"
  .errorif (length > 255), "length must be lower than 256"
    ldx #0
  !:
    lda stringAddress, x
    jsr c128lib.Kernal.BSOUT
    inx
    cpx #length
    bne !-
}
.asserterror "PrintStringWithLength($beef, 0)", { PrintStringWithLength($beef, 0) }
.asserterror "PrintStringWithLength($beef, 256)", { PrintStringWithLength($beef, 256) }
.assert "PrintStringWithLength($beef, 5)", { PrintStringWithLength($beef, 5) },
{
  ldx #0; lda $beef, x; jsr $ffd2; inx; cpx #5; bne *-9
}

#import "kernal.asm"
