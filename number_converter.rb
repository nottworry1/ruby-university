# frozen_string_literal: true

ROMAN_NUMERALS = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

def convert_to_roman(num, result = "")
  return result if num == 0
  ROMAN_NUMERALS.keys.each do |decimal|
    if num >= decimal
      return convert_to_roman(num - decimal, result + ROMAN_NUMERALS[decimal])
    end
  end
end

def convert_to_decimal(roman_numeral, result = 0)
  return result if roman_numeral.empty?
  ROMAN_NUMERALS.values.each do |roman|
    if roman_numeral.start_with?(roman)
      return convert_to_decimal(roman_numeral[roman.length..-1], result + ROMAN_NUMERALS.key(roman))
    end
  end
end

puts convert_to_roman(2945) # MMCMXLV

puts convert_to_decimal('MMCMXLV') # 2945