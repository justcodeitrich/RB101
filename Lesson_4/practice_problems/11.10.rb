#objective: add an "age_group" key to each munster name with either
# "kid", "adult", or "senior" as the value

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


# manual way

munsters_name = munsters.keys
munsters_attributes = munsters.values
counter = 0

loop do
  break if counter >= munsters_name.length
  if munsters_attributes[counter]["age"] =< 17 
    munsters[munsters_name[counter]]['age_group'] = 'kid'
  elsif munsters_attributes[counter]["age"] >= 18 && munsters_attributes[counter]["age"] <= 64
    munsters[munsters_name[counter]]['age_group'] = 'adult'
  else
    munsters[munsters_name[counter]]['age_group'] = 'senior'
  end
  counter += 1
end

# using a method

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key,value|
  value["age_group"] = if value["age"] <= 17
    "kid"
  elsif value["age"] >= 18 && value["age"] <= 64
    "adult"
  else
    "senior"
  end
end