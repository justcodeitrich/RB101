# main idea: pick out minimum age

#input: hash
#output: 1 integer

# manual way using loop

# create a counter
# create a loop
# create a break condition
# create a way of retrieving lowest value
#How do I check for lowest value? - Can iterate through each value and compare to the previous value

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
counter = 0
values_only = ages.values
lowest_age_so_far = values_only[0]


loop do
  break if counter >= ages.length
  lowest_age_so_far = values_only[counter] if lowest_age_so_far > values_only[counter]
  counter += 1
end

# The above code produced the correct answer but it also throws an error
# ArgumentError: compasion of Integer with nil failed
# Where is nil being produced from?

# the reason why nil was being produced was because of break if counter > ages.length
# this was allowing the loop to run one more time and when values_only[counter] runs, it is equal
# to 6, where there is no key/value pair for the 6th position returning nil

# using Hash#each
lowest_value = 32
ages.each do |key,value|
  lowest_value = value if lowest_value > value
end

# using Enumerable#min

ages.values.min