/**
  @file invoke.asm
  @brief Invoke module

  Set of KickAssembler macros for subroutine implementation.

  With these macros one can realize communication with subroutines using stack.
  This approach is following:

  1) subroutine caller prepares input parameters and pushes them to the stack
  using push*() macros

  2) subroutine is then called using JSR

  3) subroutine first preserves return address in local variable using
  invokeStackBegin(variablePtr) macro
  
  4) subroutine then pulls all pushed parameters in opposite order using
  pull*() macros
  
  5) when subroutine is about to end, just before RTS is called, it must
  restore return address with invokeStackEnd(varPtr) macro

  @copyright MIT Licensed
  @date 2022
*/

#importonce
.filenamespace c128lib

/**
  Preserves return address that is used with JSR.
  Should be called at beginning of subroutine.

  @param[out] value Pointer to the memory location (that is local
  variable of the subroutine) where return address will be preserved.

  @note Use c128lib_invokeStackBegin in invoke-global

  @since 0.6.0
*/
.macro invokeStackBegin(value) {
  pla
  sta value
  pla
  sta value + 1
}

/**
  Restores return address that will be then used with RTS.
  Should be called at the very end of subroutine just before RTS.

  @param[in] value Pointer to the memory location (that is local
  variable of the subroutine) from where return address will be restored.

  @note Use c128lib_invokeStackEnd in invoke-global

  @since 0.6.0
*/
.macro invokeStackEnd(value) {
  lda value + 1
  pha
  lda value
  pha
}

/**
  Pushes byte value as a parameter to the subroutine.
  Such value should be then pulled in subroutine in opposite order.

  @param[in] value Byte value of the parameter for subroutine

  @note Use c128lib_pushParamB in invoke-global

  @since 0.6.0
*/
.macro pushParamB(value) {
  lda #value
  pha
}

/**
  Pushes two bytes value as a parameter to the subroutine.
  Such value should be then pulled in subroutine in opposite order.

  @param[in] value Word value of the parameter for subroutine

  @note Use c128lib_pushParamW in invoke-global

  @since 0.6.0
*/
.macro pushParamW(value) {
  pushParamB(<value)
  pushParamB(>value)
}

/**
  Pushes byte pointed by an address as a parameter to the subroutine.
  Such value should be then pulled in subroutine in opposite order.

  @param[in] value Pointer to the byte value of the parameter for subroutine

  @note Use c128lib_pushParamBInd in invoke-global

  @since 0.6.0
*/
.macro pushParamBInd(value) {
  lda value
  pha
}

/**
  Pushes two bytes value pointed by an address as a parameter to the subroutine.
  Such value should be then pulled in subroutine in opposite order.

  @param[in] value Pointer to the two bytes value of the parameter for subroutine

  @note Use c128lib_pushParamWInd in invoke-global

  @since 0.6.0
*/
.macro pushParamWInd(value) {
  pushParamBInd(value)
  pushParamBInd(value + 1)
}

/**
  Pulls byte value from the stack and stores it under given address.

  @param[out] value Pointer to the memory location where given byte
  will be pulled to

  @note Use c128lib_pullParamB in invoke-global

  @since 0.6.0
*/
.macro pullParamB(value) {
  pla
  sta value
}

/**
  Pulls two bytes value from the stack and stores it under given address.

  @param[out] value Pointer to the beginning of memory location where
  given two bytes will be pulled to

  @note Use c128lib_pullParamW in invoke-global

  @since 0.6.0
*/
.macro pullParamW(value) {
  pullParamB(value + 1)
  pullParamB(value)
}

/**
  Pulls two bytes value from the stack and stores it under provided addresses.

  @param[out] list List of memory locations, where given two
  byte value will be stored

  @note Use c128lib_pullParamWList in invoke-global

  @since 0.6.0
*/
.macro pullParamWList(list) {
  .assert "list must be non empty", list.size() > 0, true
  pla
  .for (var i = 0; i < list.size(); i++) sta list.get(i) + 1
  pla
  .for (var i = 0; i < list.size(); i++) sta list.get(i)
}
.assert "pullParamWList([$aaaa, $bbbb])", { pullParamWList(List().add($aaaa, $bbbb)) },
{ pla;sta $aaaa + 1; sta $bbbb + 1; pla; sta $aaaa; sta $bbbb }
