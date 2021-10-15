#main idea: write a method that takes a year and returns the century

# input: 1 argument as an integer
# output: 1 string

# write a method that takes one argument
# How can I take the year given and return a specific century?
# I would need to evaluate the year against a range of numbers...
# I could use a hash with keys centuries and values as the year ranges
# also the endings (st, nd, rd, th) could be used as hashes
# How do I make it so that I'm limited to writing out all the year ranges 
# and the method can take any year even a year such as 13000?
# Is there a method? Date or Time

# Left off digging into the Time ruby docs figuring out how
# I can convert dates into Centuries

endings = {
  'st' => 1,
  'nd' => 2,
  'rd' => 3,
  'th' => [4,5,6,7,8,9,0] # I can access each element with endings['th'][0]
}

# Thinking too hard, no method
# A century is 100 years
# divide the year by 100, 
# add 1 if last digit is 1 - 9, don't add if it last digit is 0

def century(year)
century = nil
  if year.digits[0] == 0
    century = ((year/100).to_s) + "th"
  else
    century = ((year/100) + 1).to_s
    if century.end_with?('11')
      century << "th"
    elsif century.end_with?('12')
      century << "th"
    elsif century.end_with?('13') 
      century << "th"
    elsif century.end_with?('1')
      century << "st"
    elsif century.end_with?('2')
      century << "nd"
    elsif century.end_with?('3')
      century << "rd"
    else 
      century << "th"
    end
  end
  century
end

#Do the endings have to be in one method?
#How to include that into the original method above

century(2000) 
century(2001) 
century(1965) 
century(256) 
century(5) 
century(10103) 
century(1052) 
century(1127) 
century(11201)

#next issue is that the endings aren't matching up correctly
# ex. 11th century is outputting as 11st century, matching the last digit 1 as if it were 1st century

# I could make it so that anything from 4 to 99 ends with "th"



# LS SOLUTION
# TWO methods were used

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end