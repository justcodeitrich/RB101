# Write a method that returns on UUID when called with no parameters
# an UUID is 32 hexadecimal characters
# broken into 5 sections like 8-4-4-4-12 
# represented as a string

# How to generate random hexadecimal number?

HEXADECIMAL = ['1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']

def hex_generator
hex = ''
hex_length = [8,4,4,4,12]
  
hex_length.each do |occurrences|
counter = 0
  loop do 
    hex << HEXADECIMAL.sample
    hex << "-" if counter == (occurrences - 1)
    counter += 1
    break if counter == occurrences
  end
  end
hex.delete_suffix('-')
end

# LS Solution

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    puts "section:#{section} index:#{index}"
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1 # add the '-' unless index is greater than or equal to 3 (the end of the sections)
  end

  uuid
end