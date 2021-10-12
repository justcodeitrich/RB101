# Main point: Method that calculates the amount of bonus given

# Inputs: two arguments (one positive integer and one boolean(true/false))
# Outputs: A single integer dependent on boolean input 

# How to determine if a bonus is given or not?
# If the boolean is true, then return half of the given salary amount
# If false, return 0

def bonus_calc(salary,boolean)
  bonus_given = 0
  if boolean
    bonus_given = (salary / 2)
  else
  end
  bonus_given
end

puts bonus_calc(2800, true) == 1400
puts bonus_calc(1000, false) == 0
puts bonus_calc(50000, true) == 25000

#refactored 
def bonus_calc(salary,boolean)
  boolean ? salary / 2 : 0
end