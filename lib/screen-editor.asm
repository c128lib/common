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

.label JCINT          = $C000
.label JDISPLY        = $C003
.label JKEYIN         = $C006
.label JGETSCRN       = $C009
.label JPRINT         = $C00C
.label JSCRORG        = $C00F
.label JSCNKEY        = $C012
.label JREPEAT        = $C015
.label JPLOT          = $C018
.label JCRSR80        = $C01B
.label JESCAPE        = $C01E
.label JKEYSET        = $C021
.label JSCNIRQ        = $C024
.label JINIT80        = $C027
.label JSWAPPER       = $C02A
.label JWINDOW        = $C02D
.label SADDRTBL       = $C033
.label SCNVCTRS       = $C065
.label KEYPTRS        = $C06F
.label CINT           = $C07B
.label CLEAR          = $C142
.label HOME           = $C150
.label SETLINE        = $C15C
.label SETADDR        = $C15E
.label SCNIRQ         = $C194
.label KEYIN          = $C234
.label KEYLIN         = $C258
.label GETSCRN        = $C29B
.label QUOTECK        = $C2FF
.label PRNTEXIT       = $C30C


.label WRITE_VDC      = $CDCC
.label READ_VDC       = $CDDA

}
