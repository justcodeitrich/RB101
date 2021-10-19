#main idea: Write a method that takes a string of words and returns a version
#where the first and last letters of every word are swapped

#input: a string 
#output: a string

#Write a method that accepts 1 argument
#How can I swap first and last letters of each word?
#First split it by chars *** - not chars, I needed String#split
#Iterate through each word, select the first and last letters
#store these letters in variables
#prepend and concat to each word
#Once finished, concat the finished word into a final string to be returned

def swap(string)
final_string = ''
split_string = string.split

  split_string.each do |word|
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
    final_string.concat(word + ' ') 
  end
final_string.strip
end


# LS Solution
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

# Further exploration

def swap_first_last_characters(a, b)
  a, b = b, a
end

# would this method work? why or why not?
swap_first_last_characters(word[0], word[-1])

#It wouldnt work because it would return the first and last letters swapped
#But not the changed word itself