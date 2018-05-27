[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# select only evaluates the truthiness of the argument passed into truthiness
# block. The last evaluated line of the block 'hi'. Hi has a truthy value
# therefore the block will always evualate to truth. It will return each
#element in the original array.
