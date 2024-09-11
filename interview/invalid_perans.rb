# ruby interview/invalid_perans.rb

def remove_invalid_parentheses(s)
  q = [['', 0]]
  s.each_char do |ch|
    q.uniq!; q << nil

    while (e = q.shift)
      substr, lparen = e
      case ch
      when '('; q << e; q << [substr + '(', lparen + 1]
      when ')'; q << e; q << [substr + ')', lparen - 1] if lparen > 0
      else    ; q << [substr + ch, lparen]
      end
    end
  end

  out, maxlen = [], 0
  q.each do |e|
    next if e[1].nonzero?

    case e[0].size <=> maxlen
    when -1; next
    when  0; out << e[0]
    when  1; out.clear; out << e[0]; maxlen = e[0].size
    end
  end
  out.uniq
end

str="()())()"
remove_invalid_parentheses(str)

# def remove_invalid_parentheses(s)
#   str, stack, start = "", [], 0
#   s.chars.each_with_index do |c, i|
#     if stack.empty?
#       stack << c
#       start = i
#     else
#       if c == '('
#         stack << c
#       elsif stack[-1] == '('
#         stack.pop
#         if stack.empty?
#           x = s[start+1..i-1]
#           str << x if !x.nil?
#         end
#       end
#     end
#   end
#   puts str
#   puts stack
# end





# def remove_invalid_parentheses(s)

#   result=[]
#   stack=0
#   i=0
#   pair=['(',')']
#   start,last=0,0
#   remove(s,result,start,last,pair)
#   return result
# end
# def remove(s,result,start,last,pair)
#   ss=s.chars
#   for i in 0..s.length-1
#   j=last
#   stack++ if ss[i]==pair[0]
#   stack-- if ss[i]==pair[1]
#   next if stack>=0
#   i++
#   while j<=i
#   remove
# end
# def remove_invalid_parentheses(s)
#   result=[]
#   st=[]
#   i=0
#   pair=['(',')']
#   start,last=0,0
#   remove(s,result,start,last,pair,st)
# end
# def remove(s,result,start,last,pair,st)
#   s.each_byte  do |ch|
#     if ch == '('
#       puts st << ch
#     elsif ch==')'
#       if st.size ==0
#         st << ch
#       elsif st.peek==')'
#         st << ch
#       elsif st.peek=='('
#         st.pop()
#       end
#       return st
      
#     end
    
#   end
  
# end
