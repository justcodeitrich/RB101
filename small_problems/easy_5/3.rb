# main idea: Write two methods that return the number of minutes before and after midnight

# input: a string in Time format
# output: integer between 0 and 1439

# Write a method that takes 1 argument (string)
# How can I take the string and convert it to the number equivalent?
# For after midnight, take the string, remove the ":"
# Take the first two digits and multiply by 60 to get minutes

HOURS_PER_DAY = 12
MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def after_midnight(time)
  time.prepend('0') if time.length < 5
  hours = time[0..1].to_i
  minutes = time[3..4].to_i
  hours = hours * MINUTES_PER_HOUR
  total_minutes = hours + minutes
  if total_minutes == MINUTES_PER_DAY
    0
  else 
    total_minutes
  end
end

# How to convert 2:00AM to minutes after midnight?
# It should be 120 minutes 
after_midnight('2:00')
after_midnight('00:00') == 0 # true
after_midnight('12:34') == 754 # true
after_midnight('24:00') == 0 # true - added if/else specific for when total minutes is == 1440


# Before midnight

def before_midnight(time)
  time.prepend('0') if time.length < 5
  hours = time[0..1].to_i
  minutes = time[3..4].to_i
  hours = hours * MINUTES_PER_HOUR
  total_minutes = MINUTES_PER_DAY - (hours + minutes)
  if total_minutes == MINUTES_PER_DAY
    0
  else 
    total_minutes
  end
end

before_midnight('00:00') == 0 #true
before_midnight('12:34') == 686 #true
before_midnight('24:00') == 0 #true

after_midnight('00:00') == 0 
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

#Further exploration
#How would the methods change if Date and Time classes were allowed?

