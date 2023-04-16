#import "128spec/lib/128spec.asm"

sfspec: 
  init_spec() 

    describe("Divide 16bit num by 8bit num")

    it("0 / 1 = 0"); {
      // Arrange
      SetValue16Bit(dividend16, 0)
      SetValue8Bit(divisor8, 1);
      SetValue8Bit(remainder8, 0);

      // Act
      c128lib_div16By8(dividend16, divisor8, remainder8)

      // Assert
      SetValue16Bit(dividend16, 0)

      SetValue16Bit(resultExpected16, 0)
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue8Bit(resultExpected8, 0);
      assert_bytes_equal 1: remainder8: resultExpected8
    }

    it("1 / 1 = 1"); {
      // Arrange
      SetValue16Bit(dividend16, 1)
      SetValue8Bit(divisor8, 1);
      SetValue8Bit(remainder8, 0);

      // Act
      c128lib_div16By8(dividend16, divisor8, remainder8)

      // Assert
      SetValue16Bit(resultExpected16, 1)
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue8Bit(resultExpected8, 0);
      assert_bytes_equal 1: remainder8: resultExpected8
    }

    it("256 / 1 = 256"); {
      // Arrange
      SetValue16Bit(dividend16, 256);
      SetValue8Bit(divisor8, 1);
      SetValue8Bit(remainder8, 0);

      // Act
      c128lib_div16By8(dividend16, divisor8, remainder8)

      // Assert
      SetValue16Bit(resultExpected16, 256);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue8Bit(resultExpected8, 0);
      assert_bytes_equal 1: remainder8: resultExpected8
    }

    it("256 / 2 = 128"); {
      // Arrange
      SetValue16Bit(dividend16, 256)
      SetValue8Bit(divisor8, 2);
      SetValue8Bit(remainder8, 0);

      // Act
      c128lib_div16By8(dividend16, divisor8, remainder8)

      // Assert
      SetValue16Bit(resultExpected16, 128);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue8Bit(resultExpected8, 0);
      assert_bytes_equal 1: remainder8: resultExpected8
    }

    it("256 / 3 = 85 (+ 1)"); {
      // Arrange
      SetValue16Bit(dividend16, 256)
      SetValue8Bit(divisor8, 3);
      SetValue8Bit(remainder8, 0);

      // Act
      c128lib_div16By8(dividend16, divisor8, remainder8)

      // Assert
      SetValue16Bit(resultExpected16, 85);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue8Bit(resultExpected8, 1);
      assert_bytes_equal 1: remainder8: resultExpected8
    }

    describe("Divide 16bit num by 16bit num")

    it("0 / 1 = 0"); {
      // Arrange
      SetValue16Bit(dividend16, 0)
      SetValue16Bit(divisor16, 1)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(resultExpected16, 0);
      assert_bytes_equal 2: dividend16: resultExpected16 
      SetValue16Bit(resultExpected16, 0);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

    it("1 / 1 = 1"); {
      // Arrange
      SetValue16Bit(dividend16, 1)
      SetValue16Bit(divisor16, 1)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(remainder16, 0)
      lda #1
      sta resultExpected16
      lda #0
      sta resultExpected16 + 1

      SetValue16Bit(resultExpected16, 1);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue16Bit(resultExpected16, 0);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

    it("256 / 1 = 256"); {
      // Arrange
      SetValue16Bit(dividend16, 256)
      SetValue16Bit(divisor16, 1)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(resultExpected16, 256);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue16Bit(resultExpected16, 0);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

    it("256 / 2 = 128"); {
      // Arrange
      SetValue16Bit(dividend16, 256)
      SetValue16Bit(divisor16, 2)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(resultExpected16, 128);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue16Bit(resultExpected16, 0);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

    it("256 / 3 = 85 (+ 1)"); {
      // Arrange
      SetValue16Bit(dividend16, 256)
      SetValue16Bit(divisor16, 3)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(resultExpected16, 85);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue16Bit(resultExpected16, 1);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

    it("513 / 256 = 2 (+ 1)"); {
      // Arrange
      SetValue16Bit(dividend16, 513);
      SetValue16Bit(divisor16, 256)
      SetValue16Bit(remainder16, 0)

      // Act
      c128lib_div16By16(dividend16, divisor16, remainder16)

      // Assert
      SetValue16Bit(resultExpected16, 2);
      assert_bytes_equal 2: dividend16: resultExpected16 

      SetValue16Bit(resultExpected16, 1);
      assert_bytes_equal 2: remainder16: resultExpected16 
    }

  finish_spec()

* = * "Data"
dividend16: .word 0
divisor8: .byte 0
divisor16: .word 0
remainder8: .byte 0
remainder16: .word 0

resultExpected8: .byte 0
resultExpected16: .word 0

.macro SetValue8Bit(variable, value) {
  lda #value
  sta variable
}
.macro SetValue16Bit(variable, value) {
  lda #<value
  sta variable
  lda #>value
  sta variable + 1
}

#import "../lib/math-global.asm"
