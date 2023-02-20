ActiveModel::Type::Boolean.new.cast(value)

#regex example:
boolean = (var.to_s =~ /^true$/i) == 0

#ternary example:
boolean = var.to_s.eql?('true') ? true : false

#robocop suggested format
"true".to_s.casecmp('true').zero?