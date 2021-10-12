# Main idea: Create a program that randomly prints an age between 20 and 200

# Input: Nothing
# Output: A single printed message with a number generated between 20 and 200

# I'll need a random number generator
# Or I can sample within a range - ! sample is for Arrays

def teddy_age
  puts "Teddy is #{(rand(20..200))} years old!"
end


#Further Exploration - Ask for a name and print age for the name
# default to Teddy if no name given

def teddy_age
  puts "Name please"
  name = gets.chomp
  puts "#{name="Teddy"} is #{(rand(20..200))} years old!"
end