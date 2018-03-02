# In this hash of people and their age, see if spot is present

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?('Spot')
p ages.has_key?('Spot')
p ages.key?('Spot')
p ages.member?('Spot')
