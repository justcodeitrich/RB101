# main idea: Modify the word_sizes method to exclude-nonletters

# input: string
# output: hash with word sizes as keys and occurrences as values
# Does not include non-letters (such as ' , ! ?)

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    word.chars.each do |char|
      word.delete!(char) if char.match?(/[^a-zA-Z]/)
    end
    counts[word.size] += 1
  end
  counts
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {} 