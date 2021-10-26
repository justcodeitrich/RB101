# main idea: find index of first name that starts with "Be"

#input: array
#output: integer 

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# manual way

counter = 0
index = nil

loop do
  break if counter >= flintstones.length
  index = counter if flintstones[counter][0..1] == "Be"
  counter += 1
end

# with a method Array#index
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index do |name|
  name.start_with?("Be")
end
