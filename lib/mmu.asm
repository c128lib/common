/*
 * Requires KickAssembler v5.x
 * (c) 2022 Raffaele Intorcia
 *
 * References available at
 * https://c128lib.github.io/Reference/Mmu
 * https://c128lib.github.io/Reference/D500
 */
#importonce
.filenamespace c128lib

.namespace Mmu {

.label CONFIGURATION        = $D500
.label PRECONFIG_A          = $D501
.label PRECONFIG_B          = $D502
.label PRECONFIG_C          = $D503
.label PRECONFIG_D          = $D504
.label MODE_CONFIG          = $D505
.label RAM_CONFIG           = $D506
.label PAGE0_PAGE_POINTER   = $D507
.label PAGE0_BLOCK_POINTER  = $D508
.label PAGE1_PAGE_POINTER   = $D509
.label PAGE1_BLOCK_POINTER  = $D50A
.label MMU_VERSION          = $D50B

.label LOAD_CONFIG_A        = $FF01
.label LOAD_CONFIG_B        = $FF02
.label LOAD_CONFIG_C        = $FF03
.label LOAD_CONFIG_D        = $FF04

}
