# main idea: write a method that takes the square of its argument
# use the multiply method from previous question

#input: 1 integer
#output: return 1 integer

def multiply(one,two)
  one * two
end

def square(integer)
  multiply(integer,integer)
end

p square(10) == 100
p square(5) == 25
p square(-8) == 64

#Further exploration - power to the nth method

def cubed(n)
  multiply(n,n) * n
end

p cubed(10)