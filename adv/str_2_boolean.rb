
###################################################
class String
  def to_b
    case self.downcase.strip
    when 'true', 'yes', 'on', 't', '1', 'y', '=='
      return true
    when 'nil', 'null'
      return nil
    else
      return false
    end
  end
end
p "true".to_b
#######################################
class String
  def to_bool
    return true   if self == true   || self =~ (/(true|t|yes|y|1)$/i)
    return false  if self == false  || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end
p "true".to_bool

# ruby adv/str_2_boolean.rb