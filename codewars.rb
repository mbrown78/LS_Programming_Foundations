def title_case(title, minor_words="")
  result = []
  lower_case = lower_case.downcase.split(" ")
  title.split(" ").each_with_index do |word,i|
    if (lower_case.include? word.downcase) && (i != 0)
      result << word.downcase
    else
      result << word.capitalize
    end
  end
  result.join(" ")
end



def getCount(inputStr)
  inputStr.count("\\^aeiou")
end

p getCount('helloaa')

p title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
p title_case('the quick brown fox') # should return: 'The Quick Brown Fox'

def disemvowel(str)
  str.delete("aeiouAEIOU")
end

p disemvowel("this has all the vowels removed.")

def disemvowel(str)
  consonants = %w{a e i o u}
  str.split('').select { |char| !consonants.include?(char.downcase) }.join
end
