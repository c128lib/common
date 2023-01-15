#import "video.asm"
#importonce
.filenamespace c128lib

.macro @c128lib_MoveCursor(xPos, yPos) { MoveCursor(xPos, yPos) }
.macro @c128lib_PrintString(string) { PrintString(string) }
.macro @c128lib_PrintStringWithLength(string, length) { PrintStringWithLength(string, length) }
