irb(main):019> str = "hello"
=> "hello"
irb(main):020> str = str+" world"
=> "hello world"
irb(main):021> symb = :hello
=> :hello
irb(main):022> symb = symb+" world"
(irb):22:in `<main>': undefined method `+' for an instance of Symbol (NoMethodError)
irb(main):023> str.class
=> String
irb(main):025> symb.class
=> Symbol

irb(main):028> str1 = "hello"
=> "hello"
irb(main):029> str2 = "hello"
=> "hello"
irb(main):030> str1.object_id == str2.object_id
=> false

irb(main):028> str1 = "hello"
=> "hello"
irb(main):029> str2 = "hello"
=> "hello"
irb(main):030> str1.object_id == str2.object_id
=> false
irb(main):031> sym1 = :hello
=> :hello
irb(main):032> sym2 = :hello
=> :hello
irb(main):035> sym1.object_id == sym2.object_id
=> true
