#import "mem.asm"
#importonce
.filenamespace c128lib

.macro @c128lib_invokeStackBegin(placeholderPtr) { invokeStackBegin(placeholderPtr) }
.macro @c128lib_invokeStackEnd(placeholderPtr) { invokeStackEnd(placeholderPtr) }
.macro @c128lib_pushParamB(value) { pushParamB(value) }
.macro @c128lib_pushParamW(value) { pushParamW(value) }
.macro @c128lib_pushParamBInd(ptr) { pushParamBInd(ptr) }
.macro @c128lib_pushParamWInd(ptr) { pushParamWInd(ptr) }
.macro @c128lib_pullParamB(placeholderPtr) { pullParamB(placeholderPtr) }
.macro @c128lib_pullParamW(placeholderPtr) { pullParamW(placeholderPtr) }
.macro @c128lib_pullParamWList(placeholderPtrList) { pullParamWList(placeholderPtrList) }
