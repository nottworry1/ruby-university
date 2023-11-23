# frozen_string_literal: true

require 'thread'

mutex = Mutex.new
condition = ConditionVariable.new

thread_numbers = (1..10).to_a

turn_number = 1

thread_1 = Thread.new do
  loop do
    mutex.synchronize do
      if turn_number != 1
        condition.wait(mutex)
      end

      if thread_numbers.empty?
        break
      end

      puts "Thread 1: #{thread_numbers.shift}"
      turn_number = 2
      condition.signal
    end
  end
end

thread_2 = Thread.new do
  loop do
    mutex.synchronize do
      if turn_number != 2
        condition.wait(mutex)
      end

      if thread_numbers.empty?
        break
      end

      puts "Thread 2: #{thread_numbers.shift}"
      turn_number = 1
      condition.signal
    end
  end
end

thread_1.join
thread_2.join