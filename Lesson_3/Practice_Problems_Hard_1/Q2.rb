greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'
puts informal_greeting  #  => "hi there"
puts greetings

# String#<< is a modifying method. This means it will change the orginal object. The value of informal_greeting and greetings will be changed. Both informal_greeting and greeting will keep their object ids.
# informal greeting is a pointer to the original object greetings it has its own object id.


 #*****  ways to modify only the reference variable and not the original*****


#If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

#we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.

#we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.
