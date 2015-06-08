class ValueObject
  def self.attribute(name)
    attr_accessor name
    private "#{name}="
    attribute_names << name
  end

  def self.attribute_names
    @attribute_names ||= []
  end

  def initialize(data)
    keys.each do |name|
      value = data[name] || data[name.to_s]
      send("#{name}=", value)
    end
  end

  def eql?(other)
    self.class == other.class && self.attributes == other.attributes
  end
  alias_method :==, :eql?

  def attributes
    keys.reduce({}) { |attrs, key| attrs[key] = send(key); attrs }
  end
  alias_method :to_hash, :attributes

  private

  def keys
    self.class.attribute_names
  end
end

class OpenValueObject < ValueObject
  def initialize(data)
    data.keys.each { |key| self.class.attribute(key) }
    super(data)
  end
end
