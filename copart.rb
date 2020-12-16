# frozen_string_literal: true

class Range
  def doubles
    each do |a1|
      puts a1 * 2
    end
  end
end
(1..20).doubles { |i| puts i }
