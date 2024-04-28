# Welcome to contributing guide
TBD
## Guide to contributing code
TBD

## Guide to contributing documentation
### File header
TBD

### Subroutine and macro header
Every subroutine and macro should have an header like this:

<pre>
/**
 * @brief This macro copies a block of memory from one location to another using page relocation.
 * 
 * @details This macro also handles the page relocation of the memory block during the copy operation.
 * It's slower than @sa copyFast but it uses much less memory, especially for large memory blocks copy.
 *
 * @param[in] source The starting address of the memory block to be copied.
 * @param[in] destination The starting address of the location where the memory block will be copied to.
 * @param[in] count The number of bytes to be copied.
 *
 * @note Usage: copyWithRelocation($C000, $C100, 256)  // Copies 256 bytes from memory location $C000 to $C100 with relocation
 * @note Use c128lib_copyWithRelocation in mem-global.asm
 *
 * @since 0.6.0
 */
</pre>

* a @brief keyword with a short description (typically one or two line)
* a @details keyword (optional) with a longer description, with some hint about code used and comparison with similar code
* a @param keyword for every parameter, with [in], [out] or [inout] attribute to specify if parameter is an input
or output value
* a @remark keyword for indicating if registers or flags are affrected
* a @note keyword for "non-global" macros to suggest to use global macro definition
* a @since keyword to specify from which version this code is available

#### Other keywords under evaluation
* a @example keyword (optional) for pointing to other source code where method is used
* a @note keyword (optional) for a simple usage code
