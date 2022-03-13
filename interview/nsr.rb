totalNouns,totalVerbs,totalArticles = 0,0,0
correctSentence = false
input = "hij"

nouns = ["abcd", "c", "def", "h", "ij", "cde"]
verbs = ["bc", "fg", "g", "hij", "bcd"]
articles = ["a", "ac", "e"]
array = input.chars
p array.size
array.each do |x|
  if nouns.include? x
    totalNouns = totalNouns + 1
  end
  if verbs.include? x
    totalVerbs = totalVerbs + 1
  end
  if articles.include? x
    totalArticles = totalArticles + 1
  end

  if (totalVerbs >= 1 && 
    (totalNouns >= 1 || totalArticles >= 2) &&       
    ((totalNouns + totalVerbs + totalArticles) == 
      array.size))
    correctSentence = true
  end
  #correctSentence
end
p correctSentence