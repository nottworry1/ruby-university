# frozen_string_literal: true

RAISIN = 'o'
def cut_cake(cake)
  raisins = count_raisins(cake)

  raisins.sort!
  slices = get_slices(cake, raisins)

  slices << cake[raisins.last.first..-1].join("\n")
  slices
end

def get_slices(cake, raisins)
  slices = []
  raisins.each_cons(2) do |(r1, _), (r2, _)|
    slices << cake[r1...r2].join("\n")
  end
  slices
end

def count_raisins(cake)
  raisins = []
  cake.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      raisins << [i, j] if char == 'o'
    end
  end
  raisins
end

cake = [
  '.o......',
  '......o.',
  '....o...',
  '..o.....'
]

puts cut_cake(cake).join "\n\n"

