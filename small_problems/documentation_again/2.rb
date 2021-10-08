require 'date'

puts Date.civil               # => -4712-1-1
puts Date.civil(2016)         # => 2016-1-1
puts Date.civil(2016, 5)      # => 2016-5-1
puts Date.civil(2016, 5, 13)  # => 2016-5-13