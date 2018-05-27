#Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum = ages.values.min

# manual version

numbers = ages.values

  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number <= num
      next
    else
      saved_number = num
    end
    saved_number
  end
