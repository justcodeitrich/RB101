# amend this array so that all names are shortened to first three characters

#manual way
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

counter = 0
loop do
  break if counter >= flintstones.length
  flintstones[counter] = flintstones[counter][0..2]
  counter += 1
end

# with method Enumerable#map

names_shortened = flintstones.map do |name|
  name = name[0..2]
end

# LS Solution

flintstones.map! do |name|
  name[0, 3]
end