ActiveModel::Type::Boolean.new.cast(value)

#regex example:
boolean = (var.to_s =~ /^true$/i) == 0

#ternary example:
boolean = var.to_s.eql?('true') ? true : false

#robocop suggested format
"true".to_s.casecmp('true').zero?
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