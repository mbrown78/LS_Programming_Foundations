#8-4-4-4-12

#{}"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

#string  << rand()# 8 random characters from alphabet and numbers 1 to 9
#string << "-"


# range of random numbers method
# range of random letters  method
# randomly choose one method


#def generate_code(number)
#  charset = Array('A'..'Z') + Array('a'..'z') + rand(1..9)
#  Array.new(number) { charset.sample }.join
#end

def create
 a = ('a'...'z').to_a + ('0'..'9').to_a
array = []
array << a.sample(9)
array << "-"
array << a.sample(4)
array << "-"
array << a.sample(4)
array << "-"
array << a.sample(4)
array << "-"
array << a.sample(12)
array.flatten!.join

end

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1   # take of the last
    # element in last line.
  end
  uuid
end

 generate_UUID

def generate_UUID2
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    section.times { uuid += characters.sample }
    uuid += '-'
  end

   a = uuid.chars
   a.delete_at(-1)
   p a.join
end
generate_UUID2
