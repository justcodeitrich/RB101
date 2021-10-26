# objective: capitalize every first letter in each word

#manual way
words = "the flintstones rock"
split_words = words.split(" ")
counter = 0

loop do
  break if counter >= split_words.length
  p split_words[counter].capitalize!
  counter += 1
end

# this works with captialize
#----------------------------------------------------------------
# but this below doesnt work when I use upcase. Why?
# I think because it's only mutating the individual letter so the changes
# aren't being passed to the word.

# I fixed it by setting it equal to that letter position

words = "the flintstones rock"
split_words = words.split(" ")
counter = 0


loop do
  break if counter >= split_words.length
  split_words[counter][0] = split_words[counter][0].upcase!
  counter += 1
end

split_words.join(" ")

#----------------------------------------------------------------
# Using a built-in method

words = "the flintstones rock"
words = words.split(" ").map do |word|
  word.capitalize!
end

words.join(' ')

# LS Solution

words.split.map { |word| word.capitalize }.join(' ')