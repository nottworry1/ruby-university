# frozen_string_literal: true

def check_ipv4(ipv4)
  ipv4_parts = ipv4.split '.'
  return false if ipv4_parts.length != 4

  ipv4_parts.all? { |part|
    part.match?(/\A[1-9]\d*|0\Z/) && !part.match?(/\s/) && (0..255).cover?(part.to_i)
  }
end

puts "True cases: "
puts "192.0.0.1 = #{check_ipv4("192.0.0.1")}"
puts "1.0.0.1 = #{check_ipv4("1.0.0.1")}"
puts "21.0.196.1 = #{check_ipv4("21.0.196.1")}"
puts "255.255.196.1 = #{check_ipv4("255.255.196.1")}"

puts "\nFalse cases: "
puts "192. 0.0.1 = #{check_ipv4("192. 0.0.1")}"
puts "5321.0.0.10 = #{check_ipv4("5321.0.0.10")}"
puts "5321.4.0.0.10 = #{check_ipv4("5321.4.0.0.10")}"
puts "092.0.0.1 = #{check_ipv4("092.0.0.1")}"
puts "9  2.0.0.1 = #{check_ipv4("9  2.0.0.1")}"
puts "fdsfd.0.0.1 = #{check_ipv4("fdsfd.0.0.1")}"