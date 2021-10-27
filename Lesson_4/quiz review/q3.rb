# Fixing answer B
# Named the counter to two different counters - counter_inner and counter_outer

numbers = [7, 3, 5, 2, 1, 8, 4]
counter_outer = 0
counter_inner = 0

loop do
  number = numbers[counter_outer]
  counter_inner = 0

  loop do
    counter_inner += 1
    puts counter_inner

    break if counter_inner >= number
  end

  counter_outer += 1
  break if counter_outer >= numbers.size
end

# Can I do it with just one counter?


numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter]
  counter = 0

  loop do
    counter += 1
    puts counter

    break if counter >= number # at this point counter is 7
  end
  counter = (counter - number) + 1 # infinite looping
  break if counter >= numbers.size
end