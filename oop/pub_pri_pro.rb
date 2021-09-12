# frozen_string_literal: true

class A
  def m1
    puts 'public m1'
  end

  private

  def m2
    puts 'private m2'
  end
end

class B < A
  b = new b
  b.m2
end
