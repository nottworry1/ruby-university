# frozen_string_literal: true
require './array_collection'

array_collection = ArrayCollection.new

puts "Please enter element. Enter 'stop' to finish: \n>"

loop do
  input = gets.chomp
break if input == "stop"
  array_collection.add_element input
end

iterator = array_collection.get_iterator
while iterator.has_next
  puts iterator.get_next
end
