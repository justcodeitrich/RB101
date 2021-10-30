# using each method, output all the vowels from the strings


VOWELS = ['a','e','i','o','u']
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |word|
    word.chars.each do |char|
    puts char if VOWELS.include?(char)
    end
  end
end