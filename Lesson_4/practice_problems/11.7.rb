# main idea: Create a hash that counts the frequency of each letter in the string

# input: string
# output: hash of letters as keys, number of occurences as values

# manual way

statement = "The Flintstones Rock"
counter = 0
letter_freq = {}
loop do
  break if counter >= statement.length
  letter_freq[statement[counter]] = 1 if letter_freq[statement[counter]] == nil
  letter_freq[statement[counter]] += 1
  counter += 1
end

# with a method Enumerable#each_with_object
statement = "The Flintstones Rock"
letters_array = statement.chars

letters_array.each_with_object({}) do |letter, hash|
  if hash[letter] == nil
    hash[letter] = 1
  else
    hash[letter] += 1
  end
end

