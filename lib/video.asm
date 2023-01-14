
/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 */
#importonce
.filenamespace c128lib

.namespace Video {
}

/*
  Move cursor to specified coordinates inside current screen.

  Params:
  xPos - X coord on screen
  yPos - Y coord on screen
*/
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

#import "kernal.asm"
