
def method(integer)
  if integer % 2 == 1 
    true
  else
    integer % 2 == 0
    false 
    #returns true if number's absolute value is odd
  end
end

method(10)

def method(integer)
  integer % 2 == 1 ? true : false
end
method(3)

#LS solution:
def is_odd?(number)
  number % 2 == 1
end 

# without modulo

def is_odd?(number)
  number / 2 == 1
end 

is_odd?(1234)