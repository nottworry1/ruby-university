# frozen_string_literal: true

def run
  puts "Please enter a number"
  number = enter_number
  puts "Factorial of #{number} is #{factorial(number)}"
end

def enter_number
  loop do
    input = gets.chomp
    return input.to_i if number_check(input) && input.to_i >= 0 && input.to_i % 1 == 0
    puts "The number is not correct"
  end
end

def number_check(input)
  input.to_i.to_s == input
end

def factorial(number, result = number)
  return 1 if number == 0 # факторіал нуля
  factor = number - 1
  return result if factor == 0
  result *= factor
  number = factor
  factorial(number, result)
end

run