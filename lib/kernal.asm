/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 */
#importonce
.filenamespace c128lib

.label SPIN       = $ff47   // serial fast input or output
.label CLOSE_ALL  = $ff4a   // close all files to a device
.label C64MODE    = $ff4d   // enter 64 mode
.label DMA_CALL   = $ff50   // send command to dma device
.label BOOT_CALL  = $ff53   // boot a program from disk
.label PHOENIX    = $ff56   // init function cartridges
.label SWAPPER    = $ff5f   // switch between 40 or 80 colums
.label DLCHR      = $ff62   // copy char defintions from ROM to VDC RAM
.label PFKEY      = $ff65   // program function key
.label SETBNK     = $ff68   // set bank for i/o operations
.label GETCFG     = $ff6b   // get MMU bank configuration byte
.label JSRFAR     = $ff6e   // jump to subroutine in any bank
.label JMPFAR     = $ff71   // jump to routine in any bank
.label INDFET     = $ff74   // lda indexed from any bank
.label INDSTA     = $ff77   // sta indexed to any bank
.label INDCMP     = $ff7a   // cmp indexed to any bank
.label KEY        = $ff9f   // scans the entire c128 keyboard

.label SETLFS     = $ffba   // set logical file
.label SETNAM     = $ffbd   // set file name
.label OPEN       = $ffc0   // open device channel
.label CLOSE      = $ffc3   // close device channel
.label CHKIN      = $ffc7   // set channel in
.label CHKOUT     = $ffc9   // set channel out
.label CLRCH      = $ffcc   // restore default i/o channels
.label BASIN      = $ffcf   // input from channel
.label BSOUT      = $ffd2   // output to channel
.label LOAD       = $ffd5   // load from device
.label SAVE       = $ffd8   // save to device
.label SETTIM     = $ffdb   // set software clock
.label RDTIM      = $ffde   // read software clock
.label STOP       = $ffe1   // scan the STOP key
.label GETIN      = $ffe4   // get key input
.label CLALL      = $ffe7   // close all files and channels
.label SCRORG     = $ffed   // get current screen window size
.label PLOT       = $fff0   // set or read cursor position
                            // now uses $e4 - $ee, editor parameters