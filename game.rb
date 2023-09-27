# frozen_string_literal: true
$options = ["Rock", "Paper", "Scissors"]

$win = {"Rock": "Scissors",
        "Paper": "Rock",
        "Scissors": "Paper"}

def game
  puts("Enter your option\n>")
  option_a = " "
  while true
    option_a = gets.chomp
    if check_option(option_a)
    break
    else puts("Incorrect input")
    end
  end
  option_b = $options[rand(3)]
  puts option_a + " VS " + option_b
  puts result(option_a, option_b)
end

def result (option_a, option_b)
  if option_a == option_b
    "Draw!"
  elsif $win[option_a.to_sym] == option_b
    "You won!"
  else
    "You lost..."
  end
end

def check_option (option)
  unless option.is_a?(String)
    return false
  end
  $options.each do |x|
    if option.eql?x
      return true
    end
  end
  false
end

game