# print out the name, age, gender of each family member in this format:
# (Name) is a (age)-year-old (male or female).

# input: nested hash
# output: string interpolation

# Need to select name, age, gender 
# I could use Hash#each to iterate through all key value pairs

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, attributes|
  puts "#{name} is a #{attributes['age']} year old #{attributes['gender']}."
end 

# correct answer but why does attributes['age'] work?

munsters.each do |name, attributes|
  puts "#{name} is a #{name['age']} year old #{name['gender']}."
end 

# why doesn't this work? isn't this the same key[value]?
# it works but I need to put the munsters hash in front of [name] not just [name]['age']
munsters.each do |name,attributes|
  puts "#{name} is a #{munsters[name]['age']} year old #{munsters[name]['gender']}."
end 

# This code below works - I can use name inner variable to call attributes
munsters.each do |name, attributes|
  p munsters[name]["age"]
end 
