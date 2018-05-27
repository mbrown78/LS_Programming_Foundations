#What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
end

# select returns a new array containing all element for which the given block returns a true value. The last expression evaluated is 'hi'. "hi" is a truthy value. It is neither nil nor false. Therefore, on each iteration the block is returning a truthy value.  This meanst that  during each iteration the element will selected. Which element? the original element in the array. Because it is giving returning truth on each element. The method will return a new array with the same values of the 
#original array. [1, 2, 3].
