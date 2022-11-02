/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 */
#importonce
.filenamespace c128lib

.label SPIN       = $FF47   // serial fast input or output
.label CLOSE_ALL  = $FF4A   // close all files to a device
.label C64MODE    = $FF4D   // enter 64 mode
.label DMA_CALL   = $FF50   // send command to dma device
.label BOOT_CALL  = $FF53   // boot a program from disk
.label PHOENIX    = $FF56   // init function cartridges
.label JLKUPLA    = $FF59
.label JLKUPSA    = $FF5C
.label SWAPPER    = $FF5F   // switch between 40 or 80 colums
.label DLCHR      = $FF62   // copy char defintions from ROM to VDC RAM
.label PFKEY      = $FF65   // program function key
.label SETBNK     = $FF68   // set bank for i/o operations
.label GETCFG     = $FF6B   // get MMU bank configuration byte
.label JSRFAR     = $FF6E   // jump to subroutine in any bank
.label JMPFAR     = $FF71   // jump to routine in any bank
.label INDFET     = $FF74   // lda indexed from any bank
.label INDSTA     = $FF77   // sta indexed to any bank
.label INDCMP     = $FF7A   // cmp indexed to any bank
.label JPRIMM     = $FF7D
.label JCINT      = $FF81
.label JIOINIT    = $FF84
.label JRAMTAS    = $FF87
.label JRESTOR    = $FF8A
.label JVECTOR    = $FF8D
.label JSETMSG    = $FF90
.label JSECOND    = $FF93
.label JTKSA      = $FF96
.label JMEMTOP    = $FF99
.label JMEMBOT    = $FF9C
.label KEY        = $FF9F   // scans the entire c128 keyboard
.label JSETTMO    = $FFA2
.label JACPTR     = $FFA5
.label JCIOUT     = $FFA8
.label JUNTLK     = $FFAB
.label JUNLSN     = $FFAE
.label JLISTN     = $FFB1
.label JTALK      = $FFB4
.label JREADSS    = $FFB7
.label SETLFS     = $FFBA   // set logical file
.label SETNAM     = $FFBD   // set file name
.label OPEN       = $FFC0   // open device channel
.label CLOSE      = $FFC3   // close device channel
.label CHKIN      = $FFC7   // set channel in
.label CHKOUT     = $FFC9   // set channel out
.label CLRCH      = $FFCC   // restore default i/o channels
.label BASIN      = $FFCF   // input from channel
.label BSOUT      = $FFD2   // output to channel
.label LOAD       = $FFD5   // load from device
.label SAVE       = $FFD8   // save to device
.label SETTIM     = $FFDB   // set software clock
.label RDTIM      = $FFDE   // read software clock
.label STOP       = $FFE1   // scan the STOP key
.label GETIN      = $FFE4   // get key input
.label CLALL      = $FFE7   // close all files and channels
.label JUDTIM     = $FFEA
.label SCRORG     = $FFED   // get current screen window size
.label PLOT       = $FFF0   // set or read cursor position
                            // now uses $e4 - $ee, editor parameters
.label JIOBASE    = $FFF3                            