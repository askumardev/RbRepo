module StringExtension
  refine String do
    def reverse_upcase
      reverse.upcase
    end
  end
end

using StringExtension

puts "Hello World".reverse_upcase