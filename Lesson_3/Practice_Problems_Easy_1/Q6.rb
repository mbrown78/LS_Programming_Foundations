# Starting with the string
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# first
add = 'Four score'
phrase = add + " " + famous_words
p phrase

# second
"Four score and " + famous_words

# third
famous_words.prepend("Four score and ")

# fourth
"Four score and " << famous_words
