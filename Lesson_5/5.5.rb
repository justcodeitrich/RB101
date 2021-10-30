#total age of male members

#input: hash
#output: integer

# how to select male gender?
  munsters["name"]["gender"] #=> "male" or "female"

  age = 0
  munsters.each do |key,value|
    if value["gender"] == "male"
      age += value["age"]
    end
  end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


#LS solution
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444