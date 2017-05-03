def substrings(words, dic)
  str = words.downcase.split("")

  hash = Hash.new
  dic.each do |item|
    str.each do |word|
      if word.include?(item)
        if not (hash.has_key?(item))
          hash[item] = 1
        else
          hash[item] +=1
        end
      end
    end
  end
  return hash
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
