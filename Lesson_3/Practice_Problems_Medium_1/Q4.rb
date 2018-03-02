def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
# Yes, there is a difference in the two methods. The first method, which uses '<<', actually modifies the original buffer variable. The second method will add the new element, but not mutatate the input_array.

#The second implementation takes three arguments as well but, because it is using array concatenation to edit the buffer, and this creates a new array out of two arrays, it must declare another variable to store that new array to and subsequently return.

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
