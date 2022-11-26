/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 *
 * References available at
 * https://c128lib.github.io/Reference/C000
 */
#importonce
.filenamespace c128lib

.namespace ScreenEditor {

.label CINT           = $C000
.label DISPLY         = $C003
.label KEYIN          = $C006
.label GETSCRN        = $C009
.label PRINT          = $C00C
.label SCRORG         = $C00F
.label SCNKEY         = $C012
.label REPEAT         = $C015
.label PLOT           = $C018
.label CRSR80         = $C01B
.label ESCAPE         = $C01E
.label KEYSET         = $C021
.label SCNIRQ         = $C024
.label INIT80         = $C027
.label SWAPPER        = $C02A
.label WINDOW         = $C02D
.label SADDRTBL       = $C033
.label SCNVCTRS       = $C065
.label KEYPTRS        = $C06F


.label WRITE_VDC      = $CDCC
.label READ_VDC       = $CDDA

}
