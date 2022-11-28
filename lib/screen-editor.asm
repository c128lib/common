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
.label SETCHAR        = $C320
.label UDCRSR         = $C33E
.label NEXTLIN        = $C363
.label OPENLIN        = $C37C
.label SCROLL         = $C3A6
.label SCRLUP         = $C3DC
.label MOVLINE        = $C40D
.label CLRLINE        = $C4A5
.label FILLSRAM       = $C53C
.label SCNKEY         = $C55D
.label REPEAT         = $C651
.label PFKCHRS        = $C6DD
.label CRSR40         = $C6E7
.label PRINT          = $C72D
.label RTRN           = $C76F
.label MODESOFF       = $C77D
.label COLORSET       = $C7DA
.label RSTRPOS        = $C932
.label DELCHAR        = $C93D
.label TESTTAB        = $C96C
.label ESCAPE         = $C9BE
.label ESCTBL         = $C9DE
.label SETTOP         = $CA14
.label SETBTM         = $CA16
.label WINDOW         = $CA1B
.label FULLW          = $CA24
.label READCHR        = $CB58
.label TESTLINK       = $CB74
.label SETLINK        = $CB81
.label UNLINK         = $CB81
.label LINK           = $CB93
.label FINDLINK       = $CB93
.label FINDEND        = $CBC3
.label FORWARD        = $CBED
.label RETREAT        = $CC00
.label SAVEPOS        = $CC1E
.label SPACE          = $CC27
.label DISPLY1        = $CC2F
.label DISPLY2        = $CC32
.label DISPLY         = $CC32
.label SCRORG         = $CC32
.label PLOT           = $CC6A
.label KEYSET         = $CCA2
.label SWAPPER        = $CD2E
.label CRSR80         = $CD57
.label CRSRON         = $CD6F
.label CRSROFF        = $CD9F
.label WRITE80        = $CDCA
.label WRITEREG       = $CDCC
.label READ80         = $CDD8
.label READREG        = $CDDA
.label SCNPOS         = $CDE6
.label ATTRPOS        = $CDF9
.label INIT80         = $CE0C
.label COLORTBL       = $CE4C
.label COLOR80        = $CE5C

}
