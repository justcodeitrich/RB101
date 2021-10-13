# main idea: Print all even numbers from 1 to 99 inclusively
# each number printed on a new line

#input: nothing
#output: even numbers from 1 to 99 inclusive of 99

i = 2
until i > 99
  puts i if i % 2 == 0
  i += 2
end
