#main idea: write a method that takes a year and 
#returns a boolean depending on if the year given is a leap year or not

#input: 1 integer argument
#output: boolean

#What is a leap year? 
# year is evenly divisible by 4 except years also divisible by 100
# if year is divisible by 100, then it's not a leap year unless
# it's divisible by 400

# write a method that accepts 1 argument
# evaluate if the argument is divisible by 4, if yes return true, false if not
# if yes, then divide by 100
# if yes, then divide by 400
# return boolean

# I'm not understanding the divisible by 100 and 400
# if the year is divisible by 100, then it's not a leap year unless it is divisible by 400
# used a flow chart for this

def leap_year?(integer)
  if integer % 4 == 0
    true
    if integer % 100 == 0
      if integer % 400 == 0
        return true
      else
        return false
      end
    else
    return true
    end
  else
  return false
  end 
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true


# LS Solution
# This solution tests for edge cases first and then gets broader

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# Further exploration:
# The method below will return false for any leap year that is divisible by 400
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

#The reordering of the LS solution is my original. and it is more complicated
# than the LS solution
