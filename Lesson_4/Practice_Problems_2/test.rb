
membership = { "Silver" => "Gold",
               "Bronze" => "Silver" }
sentence = "Anna Jones is a Silver member John Jones is a Bronze member"

 sentence.gsub(/\w+/) { |m| membership.fetch(m,m)}
 sentence.gsub(/\w+/) { |m| membership.fetch(m,&:itself)}

answer = sentence.gsub(/\w+/) do |m|
   #m looping through all the words in the sentence
   #we are matching that with keys within membership
   membership.fetch(m,m) #Returns a value from the hash for the given key. If the key can’t be found, there are
end

p answer
