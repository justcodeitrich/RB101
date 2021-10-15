#main idea: Write a method that returns true if integer is palindromic

#input: 1 number
#output: boolean

#How can I reverse the numbers of an integer?
# Does reverse method exist for integers? - no
# I could turn it into a string and reverse it

def palindromic_number?(integer)
  integer.to_s == integer.to_s.reverse
end

#Further exploration
# Does method still work if my number begins with 0s? 
# no, if its led only by 0s, it will remove the 0 until it reaches a non-zero number
# also if there are zeros after the number, it returns a different number
# ex - 0003000 #=> "1536"

