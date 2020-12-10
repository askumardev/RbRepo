class Range
	def doubles
		self.each do|a1|
			puts a1*2
		end

	end
end
(1..20).doubles{|i| puts i}