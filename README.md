# value_object

Simple value objects in Ruby.

### ValueObject

Like `Struct`, but without order dependent arguments.

```ruby
require "value_object"

class Fruit < ValueObject
  attribute :name
  attribute :color
end

apple = Fruit.new({ name: "Apple", color: "Red" })
apple.name
apple.color
apple.foo #=> NoMethodError
```

### OpenValueObject

Like `OpenStruct`, but with less nil and more no-method errors.

```ruby
apple = OpenValueObject.new({ name: "Apple", color: "Red", kind: "Fuji"})

apple.name
apple.color
apple.kind
apple.foo #=> NoMethodError
```
