# main idea: add up all the ages

# input: hash
# output: integer

# manual way
# initialize a variable set to 0
# loop through the ages hash and add the values 

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age = 0
counter = 0
ages_values = ages.values

loop do
  age = age + ages_values[counter]
  break if counter > ages.length
  counter += 1
end

#Why is this returning TypeError: nil can't be coerced into Integer? yet age is updated to 6174
# I think loop returns nil
# using a method

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_total = 0

ages.each_value do |age|
  age_total += age
end