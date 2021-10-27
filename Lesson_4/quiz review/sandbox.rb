# testing changing variables using break
# could this be useful for resetting counter?

a = 3
counter = 0

a = loop do
  counter += 1
  break counter = 0 if counter == 2
end

puts counter