# Objective: Write a method that takes a float between 0 and 360 degrees
# and returns a string that represents that angle in degrees, minutes and seconds

# input: float
# output: string

# requirements:
# use ° for degrees
# use ' for minutes
# use " for seconds
# final returned string looks like this: degrees, minutes, seconds -  10°10'10" 

DEGREE = "\xC2\xB0" # ° symbol

# Original Algo
# Write a method with one parameter
# Initialize a variable to be the final returned value
# How do I convert a float into degrees, minutes, seconds?
# The degrees is the portion before the decimal of a float
# The minutes and seconds are the parts after the decimal
# To get degrees from the float - use #to_i
# To get minutes, use the float % float.to_i to get the numbers after decimal only
# take that remaining number and divide by 60 to get the minutes and again by 60 to get seconds 
# final returned value is a string interpolation 

# Modified algo 
# Write a method with one parameter
# Initialize a variable to be the final returned value
# How do I convert a float into degrees, minutes, seconds?
# The degrees is the portion before the decimal of a float
# The minutes and seconds are the parts after the decimal
# To get degrees from the float - use #to_i
# To get minutes, use the float % float.to_i to get the numbers after decimal only
    # take that remaining number and multiply by 60 to get minutes 
    # repeat again and multiply by 60 to get seconds
# round each number to two decimal points
# final returned value is a string interpolation 

# test case - using this given code to compare minutes and seconds output
# dms(76.73) == %(76°43'48")
def dms(float)
return_value = ''
  p degrees = float.to_i
  p minutes = (float % float.to_i) * 60 # this figures out what 73% of 1 full degree(60 minutes) is
  p seconds = (minutes % minutes.to_i) * 60 
end

# Actual code
DEGREE = "\xC2\xB0"

def float_to_degrees(float)
  degrees = float.to_i
end

def float_to_minutes(float)
  minutes = (((float % float.to_i) * 60).to_i).to_s
  minutes = "0" + minutes if minutes.length < 2
  minutes
end

def float_to_seconds(float)
  seconds = ((((float % float.to_i) * 60) % (((float % float.to_i) * 60).to_i) * 60).to_i).to_s
  seconds = "0" + seconds if seconds.length < 2
  seconds
end

def dms(float)
  
  if float.to_i.zero?
    degrees = "0"
    minutes = "00"
    seconds = "00"
  
  elsif float % float.to_i == 0
    degrees = float_to_degrees(float)
    minutes = "00"
    seconds = "00"
    
  else
    degrees = float_to_degrees(float)
    minutes = float_to_minutes(float)
    seconds = float_to_seconds(float)
    
  end
  p "#{degrees}#{"\xC2\xB0"}#{minutes}\'#{seconds}\""
end

dms(30) == %(30°00'00") 
dms(76.73) == %(76°43'48") 
dms(254.6) == %(254°36'00") 
dms(93.034773) == %(93°02'05") #=> "93°2'5\"" - fixed
dms(0) == %(0°00'00") 
dms(360) == %(360°00'00") || dms(360) == %(0°00'00") 

#LS Solution

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  binding.pry
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  binding.pry
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  binding.pry
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  binding.pry
end