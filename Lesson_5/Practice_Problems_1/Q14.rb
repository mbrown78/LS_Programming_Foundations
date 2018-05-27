hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# loop through a hash
# if its a vegetable return sizes
# if its a fruit return the color
# put into an array

new_array = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
p new_array


#  we want to return an array map is a good choice

#:colors is complicated slightly in that we want to call capitalize on the strings but they are nested within arrays so we need to iterate through those arrays in order to access them.

# we can use map to iterate through again 

# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
