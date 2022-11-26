/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 */
#importonce
.filenamespace c128lib

.namespace Kernal {

.label SPIN       = $FF47   // Serial fast input or output
.label CLOSE_ALL  = $FF4A   // Close all files to a device
.label C64MODE    = $FF4D   // Enter 64 mode
.label DMA_CALL   = $FF50   // Send command to dma device
.label BOOT_CALL  = $FF53   // Boot a program from disk
.label PHOENIX    = $FF56   // Init function cartridges
.label LKUPLA     = $FF59
.label LKUPSA     = $FF5C
.label SWAPPER    = $FF5F   // Switch between 40 or 80 colums
.label DLCHR      = $FF62   // Copy char defintions from ROM to VDC RAM
.label PFKEY      = $FF65   // Program function key
.label SETBNK     = $FF68   // Set bank for i/o operations
.label GETCFG     = $FF6B   // Get MMU bank configuration byte
.label JSRFAR     = $FF6E   // Jump to subroutine in any bank
.label JMPFAR     = $FF71   // Jump to routine in any bank
.label INDFET     = $FF74   // Lda indexed from any bank
.label INDSTA     = $FF77   // Sta indexed to any bank
.label INDCMP     = $FF7A   // Cmp indexed to any bank
.label PRIMM      = $FF7D   // Print Immediate utility
.label CINT       = $FF81   // Initialize screen editor and devices
.label IOINIT     = $FF84   // Initialize system I/O
.label RAMTAS     = $FF87   // Init RAM and buffers
.label RESTOR     = $FF8A   // Initialize Kernal indirects
.label VECTOR     = $FF8D   // Initialize or copy indirects
.label SETMSG     = $FF90   // Kernal messages on/off
.label SECOND     = $FF93   // Serial - send SA after LISTEN
.label TKSA       = $FF96   // Serial - send SA after TALK
.label MEMTOP     = $FF99   // Read/set top of system RAM
.label MEMBOT     = $FF9C   // Set/read bottom of system RAM
.label KEY        = $FF9F   // Scans the entire c128 keyboard
.label SETTMO     = $FFA2
.label ACPTR      = $FFA5   // Serial - byte input
.label CIOUT      = $FFA8   // Serial - byte output
.label UNTLK      = $FFAB   // Serial - send untalk
.label UNLSN      = $FFAE   // Serial - send unlisten
.label LISTN      = $FFB1   // Serial - send listen command
.label TALK       = $FFB4   // Serial - send talk
.label READST     = $FFB7   // Read I/O status byte
.label SETLFS     = $FFBA   // Set logical file
.label SETNAM     = $FFBD   // Set file name
.label OPEN       = $FFC0   // Open device channel
.label CLOSE      = $FFC3   // Close device channel
.label CHKIN      = $FFC6   // Set channel in
.label CHKOUT     = $FFC9   // Set channel out
.label CLRCH      = $FFCC   // Restore default i/o channels
.label BASIN      = $FFCF   // Input from channel
.label BSOUT      = $FFD2   // Output to channel
.label LOAD       = $FFD5   // Load from device
.label SAVE       = $FFD8   // Save to device
.label SETTIM     = $FFDB   // Set software clock
.label RDTIM      = $FFDE   // Read software clock
.label STOP       = $FFE1   // Scan the STOP key
.label GETIN      = $FFE4   // Get key input
.label CLALL      = $FFE7   // Close all files and channels
.label UDTIM      = $FFEA   // Increment internal clock
.label SCRORG     = $FFED   // Get current screen window size
.label PLOT       = $FFF0   // Set or read cursor position
                            // Now uses $e4 - $ee, editor parameters
.label IOBASE     = $FFF3   // Reads base address of I/O block

}
