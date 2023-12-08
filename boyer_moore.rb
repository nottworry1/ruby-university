# frozen_string_literal: true

def find_pattern(text, pattern)
  text_length = text.length
  pattern_length = pattern.length
  shift_table = make_shift_table(pattern)

  i = pattern_length - 1
  while i < text_length
    j = pattern_length - 1
    while j >= 0 && text[i] == pattern[j]
      i -= 1
      j -= 1
    end

    if j < 0
      return "Text pattern has been found at index #{i + 1}"
    else
      i += [shift_table[text[i]], pattern_length - j].max
    end
  end

  "Text pattern not found"
end

def make_shift_table(pattern)
  shift_table = Hash.new(pattern.length)
  (0...pattern.length - 1).each do |i|
    shift_table[pattern[i]] = pattern.length - 1 - i
  end
  shift_table
end

puts find_pattern("I'm a text", "text")