# frozen_string_literal: true

def run
  puts "Please enter a number"
  number = enter_number
  puts "#{number} is prime? #{prime_check(number)}"
end

def enter_number
  loop do
    input = gets.chomp
    return input.to_i if number_check(input) && input.to_i > 0 && input.to_i % 1 == 0
    puts "The number is not correct"
  end
end

def number_check(input)
  input.to_i.to_s == input
end

def prime_check(number)
  for i in 2..Math.sqrt(number) do
    return false if number % i == 0
  end
  true
end

run