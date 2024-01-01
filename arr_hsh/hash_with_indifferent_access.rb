# ruby arr_hsh/hash_with_indifferent_access.rb

require 'active_support/all'

hash = { :one => "Sample", :two => 2, :three => 3 }
p hash[:one]
p hash['one']  # returns nil

# make Hash obj to obj of HashWithIndifferentAccess Class.
hash =  ActiveSupport::HashWithIndifferentAccess.new(hash)
p hash[:one]

p hash['one']
