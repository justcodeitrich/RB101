#main idea: write a method that takes two strings, compares which is longer
#and combines them as shorter string + longer string + shorter string

#input: two arguments as strings
#output: single string

# Write a method that takes two arguments
# How can I make them be compared and combined together?
# I can use String.length on each and use if else statements
# Create a variable to hold the final returned string
# After determining which string is longer, use String#join and push it into the final variable
# Can String#join combined more than 1 string? no, join is actually an Array method, not String
# Instead I can push it into the final variable using a concat of the three

# Return the final variable

def short_long_short(string1, string2)
  final_string = ''
  if string1.length > string2.length
    final_string = string2.concat(string1,string2)
  else 
    final_string = string1.concat(string2,string1)
  end
  final_string
end

short_long_short('abc', 'defgh')

#LS Solution
def short_long_short(string1,string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end
