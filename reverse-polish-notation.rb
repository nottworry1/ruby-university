# frozen_string_literal: true

def to_rpn
  operators = {'+' => 1,
               '-' => 1,
               '*' => 2,
               '/' => 2,
               '^' => 3 }
  final_output = []
  stack = []

  input = gets.chomp

  input.scan(/\d+|[-+*\/()]/).each do |token|
    if token.match?(/[[:digit:]]/)
      final_output.push token
    elsif token == "("
      stack.push token
    elsif token == ")"
      while stack.last != "("
        final_output.push stack.pop
      end
      stack.pop
    else
      while !stack.empty? && operators[token] <= operators[stack.last].to_i
        final_output.push stack.pop
      end
      stack.push token
    end
  end

  until stack.empty?
    final_output.push stack.pop
  end

  puts "input --> " + input
  puts "output --> " + final_output.join(' ')
end

to_rpn
