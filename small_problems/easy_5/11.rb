# main idea: With the given method, will the returned string be the same object
# as the one passed in as an argument?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

#it'll be a different object - reversed.