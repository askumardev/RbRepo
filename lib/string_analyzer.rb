class StringAnalyzer 
  def has_vowels?(str)
    !!(str =~ /[aeio]+/i)
  end 
end