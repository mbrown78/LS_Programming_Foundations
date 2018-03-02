#We could have used either Array
#concat or Array#push to add Dino to the family.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#How can we add multiple items to our array? (Dino and Hoppy)
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
p flintstones
