require "pry-byebug"

class Hash
  def to_struct(hash = self)
    Struct.new(*hash.keys).new(*hash.values.map! { |v| (v.is_a?(Hash) ? to_struct(v) : v ) } )
  end
end
