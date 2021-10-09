#two arguments (String, positive integer)

def repeat(string,integer)
  integer.times {|x| puts string }
end

repeat("hi",10)


def repeat(string,integer)
  puts (string + "\n") * integer
end
repeat("hi",10)