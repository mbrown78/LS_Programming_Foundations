numbers = [1, 2, 3, 4, 5]

# delete_at deletes at a position
# Docs: Deletes the element at the specified index, returning that element, or nil if the index is out of range.
numbers.delete_at(1)  # => 2  numbers is now [1, 3, 4, 5]


# delete 1 finds the element that matches 1 and deletes i
numbers.delete(1) # => 1  numbers is now [2, 3, 4, 5]
# docs: Deletes all items from self that are equal to obj.
