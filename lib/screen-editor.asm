/**
  @file screen-editor.asm
  @brief Screen editor labels
  @details Labels for screen editor

  @copyright MIT Licensed
  @date 2022
*/
#importonce
.filenamespace c128lib

.namespace ScreenEditor {

/** Set default characteristics for 40 and 80 column displays */
.label JCINT          = $C000
/** Deposit a screen code to current position */
.label JDISPLY        = $C003
/** Retrieves a single character from keyboard */
.label JKEYIN         = $C006
/** Retrieves a character from a line of keyboard or screen input */
.label JGETSCRN       = $C009
/** Prints a character at the current position with current attribute */
.label JPRINT         = $C00C
/** Returns information about the current window size */
.label JSCRORG        = $C00F
/** Scans keyboard for keypress */
.label JSCNKEY        = $C012
/** Alternative for SCNKEY routine */
.label JREPEAT        = $C015
/** Reads or sets the cursor position */
.label JPLOT          = $C018
/** Moves cursor on 80 column display to coordinates */
.label JCRSR80        = $C01B
/** Escape sequence handling routing */
.label JESCAPE        = $C01E
/** Redefines a programmable key */
.label JKEYSET        = $C021
/** Handler the screen editor portion of the IRQ handling sequence */
.label JSCNIRQ        = $C024
/** Initializas the character patterns for the 80 column display */
.label JINIT80        = $C027
/** Switches active screen displays */
.label JSWAPPER       = $C02A
/** Sets the position of a corner of the output window */
.label JWINDOW        = $C02D
/** Table of screen line starting address */
.label SADDRTBL       = $C033
/** Table of default screen editor indirect vectors */
.label SCNVCTRS       = $C065
/** Table of default keyboard decoding table pointers */
.label KEYPTRS        = $C06F
/** Initializes screen editor contants, variables, tables and vectors */
.label CINT           = $C07B
/** Clears the current window and homes the cursor */
.label CLEAR          = $C142
/** Moves the cursor to the home position of the current window */
.label HOME           = $C150
/** Sets starting address pointers for the current line */
.label SETLINE        = $C15C
/** Sets starting address pointers for a specified line */
.label SETADDR        = $C15E
/** Performs screen and keyboard portion of IRQ functions */
.label SCNIRQ         = $C194
/** Performs GETIN from keyboard */
.label KEYIN          = $C234
/** Accepts a line of keyboard input and returns the first character */
.label KEYLIN         = $C258
/** Performs BASIN fron screen or keyboard */
.label GETSCRN        = $C29B
/** Handles quote mode flag */
.label QUOTECK        = $C2FF
/** Provides common exit for screen BSOUT */
.label PRNTEXIT       = $C30C
/** Handles character printing for screen BSOUT */
.label SETCHAR        = $C320
/** Updates the cursor position */
.label UDCRSR         = $C33E
/** Moves the cursor down one line */
.label NEXTLIN        = $C363
/** Insert a new line linked to the one above */
.label OPENLIN        = $C37C
/** Scrolls the window up one line */
.label SCROLL         = $C3A6
/** Copies lines up one row and clears bottom line */
.label SCRLUP         = $C3DC
/** Copies character from a line to another */
.label MOVLINE        = $C40D
/** Clears a line */
.label CLRLINE        = $C4A5
/** Fills or copies a block of 8563 Ram (Vdc) */
.label FILLSRAM       = $C53C
/** Scans keyboard matrix for keypress */
.label SCNKEY         = $C55D
/** Decodes key matrix value into character value and handles key repeating */
.label REPEAT         = $C651
/** Table of programmable key character values */
.label PFKCHRS        = $C6DD
/** Handles cursor blinking for 40 column screen */
.label CRSR40         = $C6E7
/** Handles BSOUT to the screen */
.label PRINT          = $C72D
/** Handles return and shift-return characters */
.label RTRN           = $C76F
/** Cancels quote and reverse modes and clears pending inserts */
.label MODESOFF       = $C77D
/** Handles color change characters */
.label COLORSET       = $C7DA
/** Restores the cursor row and columns positions */
.label RSTRPOS        = $C932
/** Deletes a character in a logical line */
.label DELCHAR        = $C93D
/** Tests tab stop bit for current cursor position */
.label TESTTAB        = $C96C
/** Handles Esc sequences */
.label ESCAPE         = $C9BE
/** Table of Esc key dispatch addresses */
.label ESCTBL         = $C9DE
/** Defines the upper left corner of the window */
.label SETTOP         = $CA14
/** Defines the lower right corner of the window */
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
.label MASKTBL        = $CE6C
.label VARTBL         = $CE74
.label KEYDEFS        = $CEA8

}
