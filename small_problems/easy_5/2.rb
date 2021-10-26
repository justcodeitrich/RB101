# main idea: Write a method that takes a minute-based format and returns the time of day
# in a 24 hour format of (hh:mm)

# input: an integer (0,positive or negative)
# output: time in a 24 hr format

# Cannot use Date or Time classes
# There are 1440 minutes in 24 hours

# Create constants for minutes
# Write a method that takes 1 parameter 
# When an integer is passed as an argument, how can I convert that into a time?
  # Is there a method that converts integer into time?
  # Is time its own data type or is it a string in the hh:mm format?

# Hint: Kernel#format or Integer#divmod may be useful
  # What is the Kernel#format to convert Integer to Time?
  # I'm going to assume that the answer is actually a string format of hh:mm
  # Kernel#format isn't converting data types at all, it's just adjusting the format

# In that case, assuming that I can manually piece together time
# Take the parameter and use divmod to determine how many minutes left over
  # can be applied to the day
  # Integer#divmod(integer to divide by) => [quotient, modulo]
# I need to use divmod twice.
  # 1 - use divmod to see how many days the argument is equal to - argument.divmod(1440)
  # 2 - using the modulus from the first divmod, use that as the caller to a second divmod(60) to get the minutes
    # ex. Step 1: 1530.divmod(1440) => [1,90] - 1 day, 90 minutes 
    # ex. Step 2: 90.divmod(60) => [1,30] - 1 hour, 30 minutes aka 1:30 AM
  # save the output from step 2 into two variables - hour and minutes
# Then I can string interpolate it as #{hour}:#{minutes}

# Will this work for negative numbers?
# Can I divmod a negative number?
# Start with positive argument first

MINUTES_IN_A_DAY = 1440
MINUTES_IN_A_HOUR = 60

def time_of_day(param)

days, minutes = param.divmod(MINUTES_IN_A_DAY)
hours, minutes = minutes.divmod(MINUTES_IN_A_HOUR)
hours = hours.to_s
minutes = minutes.to_s
hours.prepend("0") if hours.length < 2
minutes.prepend("0") if minutes.length < 2

return "#{hours}:#{minutes}"
end
#What dont I understand?
# I don't understand how -3 / 1440 can result in [-1,1437]
# the quotient is -0.0020833333.
# Answer: the quotient is -1 because -3/1440.floor is -0.0020833 rounded to the closest integer less than itself

time_of_day(0) == "00:00" #true
time_of_day(-3) == "23:57"
-3.divmod(1440) #=> using a calculator this results in -0.002
days = -1
minutes = 1437

1437.divmod(60)
hours = 23
minutes = 57



time_of_day(35) == "00:35" #true
time_of_day(-1437) == "00:03" 
time_of_day(3000) == "02:00" #true
time_of_day(800) == "13:20" #true
time_of_day(-4231) == "01:29"

# As of now it only works for a positive number that returns a time using all 4 hh:mm slots
# This is probably where Kernel#format comes in to add missing 0s
# I could also use prepend depending on length of the hours and minutes
# Hah! It works. It's a lazy way of avoiding Kernel#format but it works
# Now to the negative numbers

# What happens when I divmod a negative number?
# What if when the argument passed is negative, I just subtract from 24 hours and 60 minutes
# Hmm... somehow my method I made for positive numbers only works for negatives too
# Why?
# I'll have to go back to divmod method

# The reason why this works is because for Numeric#divmod(argument)
# If the argument is positive, the returned value is negative and if the argument is negative, the returned value is negative
# This occurs regardless of what the numeric caller's sign is

# time_of_day(-1437) == "00:03"
# -1437.divmod(1440) #=> [-1,3]
# 3.divmod(60) #=> [0,3]

#LS Solution:
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0 # This checks for negative numbers
    minutes += MINUTES_PER_DAY # Adds 1440 to the negative number until the minutes variable is positive
  end

  minutes % MINUTES_PER_DAY # Calculates the remaining minutes by dividing by 1440
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes) #remaining minutes stored in delta_minutes
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR) #divmod delta_minutes to get the hours and minutes
  format('%02d:%02d', hours, minutes)
end

# So this works for both negative and positive because ultimately whatever argument is passed is added is put into a range of 0 - 1439 minutes

# Further exploration:


# Problem 1: - Write a single calculation with % that performs entire normalization in 1 line

def normalize_minutes_to_0_through_1439(minutes)
  minutes < 0 ? minutes += MINUTES_PER_DAY : minutes % MINUTES_PER_DAY 
end

# Problem 2:
# From Time doc -  Time.at(1234).strftime "%M:%S" 

# Problem 3: 
# Allowed to use Date and Time classes, how can I consider the day of the week?

# Time.local(2021,10,17).strftime "%A %H:%M" #=> Sunday 00:00