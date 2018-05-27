#What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

#Removes a key-value pair from hsh and returns it as the two-item array [ *key, value* ], or the hash’s default value if the hash is empty.

# shift destructively removes the first key-value pair in hash and returns it as a two-item array.

# we can check in irb to see if it is destructive.
