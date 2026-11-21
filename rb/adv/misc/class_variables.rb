# ruby basics/ObjClsOop/class_variables.rb

class Test
  @@test = "Sample class variable text"

  class << self
    def cls_var_test
      @@test
    end
  end
end

p Test.cls_var_test

p Test.class_variable_get(:@@test)