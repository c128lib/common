/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 *
 * References available at
 * https://c128lib.github.io/Reference/C000
 */
#importonce
.filenamespace c128lib

.label CINT           = $C000
.label DISPLY         = $C003
.label KEYIN          = $C006
.label GETSCRN        = $C009
.label PRINT          = $C00C
.label SCRORG         = $C00F

.label WRITE_VDC      = $CDCC
.label READ_VDC       = $CDDA
