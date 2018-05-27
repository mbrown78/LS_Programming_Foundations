#In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#throw out the really old people (age 100 or older).


# First try
ages.select! do |key, age|
   age < 100
end

# Second try

p ages.select! {|k,v| v < 100 }

# LS
#Hash#select! tells us that it is "Equivalent to Hash#keep_if, but returns nil if no changes were made", though in this case that wouldn't have made any difference.
# keep_if is destructive

p ages.keep_if { |_, age| age < 100 }
