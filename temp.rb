require 'pry'

sentence = 'To be or not to be'

def string_lengths(sentence)
  strings = sentence.split
  p strings
  lengths = []
  counter = 1
  p counter
  p strings.size

  until counter == strings.size do
    p strings[counter -1 ]
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths(sentence)
