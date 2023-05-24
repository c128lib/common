/**
  @file kernal.asm
  @brief Kernal module
  @details Label for kernal rountine mapping

  <a href="https://c128lib.github.io/Reference/FF47">
  Online c128lib reference
  </a>

  @copyright MIT Licensed
  @date 2022
*/

#importonce
.filenamespace c128lib

/** 
  <a href="https://c128lib.github.io/Reference/FF47">
  Online c128lib reference
  </a>
*/
.namespace Kernal {

/** Serial fast input or output */
.label SPIN       = $FF47
/** Close all files to a device */
.label CLOSE_ALL  = $FF4A
/** Enter 64 mode */
.label C64MODE    = $FF4D
/** Send command to dma device */
.label DMA_CALL   = $FF50
/** Boot a program from disk */
.label BOOT_CALL  = $FF53
/** Init function cartridges */
.label PHOENIX    = $FF56
/** Work around a user’s open disk channels */
.label LKUPLA     = $FF59
/** Work around a user’s open disk channels */
.label LKUPSA     = $FF5C
/** Switch between 40-column VIC (composite) video display and 80-column 8563 (RGBI) video display. */
.label SWAPPER    = $FF5F
/** Copy char defintions from ROM to VDC RAM */
.label DLCHR      = $FF62
/** Program function key */
.label PFKEY      = $FF65
/** Set bank for i/o operations */
.label SETBNK     = $FF68
/** Get MMU bank configuration byte */
.label GETCFG     = $FF6B
/** Jump to subroutine in any bank */
.label JSRFAR     = $FF6E
/** Jump to routine in any bank */
.label JMPFAR     = $FF71
/** Lda indexed from any bank */
.label INDFET     = $FF74
/** Sta indexed to any bank */
.label INDSTA     = $FF77
/** Cmp indexed to any bank*/
.label INDCMP     = $FF7A
/** Print Immediate utility */
.label PRIMM      = $FF7D
/** Initialize screen editor and devices */
.label CINT       = $FF81
/** Initialize system I/O */
.label IOINIT     = $FF84
/** Init RAM and buffers */
.label RAMTAS     = $FF87
/** Initialize Kernal indirects */
.label RESTOR     = $FF8A
/* Initialize or copy indirects* */
.label VECTOR     = $FF8D
/** Kernal messages on/off */
.label SETMSG     = $FF90
/** Serial - send SA after LISTEN */
.label SECOND     = $FF93
/** Serial - send SA after TALK */
.label TKSA       = $FF96
/** Read/set top of system RAM */
.label MEMTOP     = $FF99
/** Set/read bottom of system RAM */
.label MEMBOT     = $FF9C
/** Scans the entire c128 keyboard */
.label KEY        = $FF9F
/** Not used in the C128 */
.label SETTMO     = $FFA2
/** Serial - byte input */
.label ACPTR      = $FFA5
/** Serial - byte output */
.label CIOUT      = $FFA8
/** Serial - send untalk */
.label UNTLK      = $FFAB
/** Serial - send unlisten */
.label UNLSN      = $FFAE
/** Serial - send listen command */
.label LISTN      = $FFB1
/** Serial - send talk */
.label TALK       = $FFB4
/** Read I/O status byte */
.label READST     = $FFB7
/** Set logical file */
.label SETLFS     = $FFBA
/** Set file name */
.label SETNAM     = $FFBD
/** Open device channel */
.label OPEN       = $FFC0
/** Close device channel */
.label CLOSE      = $FFC3
/** Set channel in */
.label CHKIN      = $FFC6
/** Set channel out */
.label CHKOUT     = $FFC9
/** Restore default i/o channels */
.label CLRCH      = $FFCC
/** Input from channel */
.label BASIN      = $FFCF
/** Output to channel */
.label BSOUT      = $FFD2
/** Load from device */
.label LOAD       = $FFD5
/** Save to device */
.label SAVE       = $FFD8
/** Set software clock */
.label SETTIM     = $FFDB
/** Read software clock */
.label RDTIM      = $FFDE
/** Scan the STOP key */
.label STOP       = $FFE1
/** Get key input */
.label GETIN      = $FFE4
/** Close all files and channels */
.label CLALL      = $FFE7
/** Increment internal clock */
.label UDTIM      = $FFEA
/** Get current screen window size */
.label SCRORG     = $FFED
/** Set or read cursor position */
.label PLOT       = $FFF0
/** Reads base address of I/O block */
.label IOBASE     = $FFF3

}
