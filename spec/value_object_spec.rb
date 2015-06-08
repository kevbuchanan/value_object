require "spec_helper"
require "value_object"

describe ValueObject do

  class Fruit < ValueObject
    attribute :name
    attribute :color
  end

  it "initializes attributes with symbol keys" do
    data = Fruit.new({ name: "Apple", color: "Red" })

    expect(data.name).to eq("Apple")
    expect(data.color).to eq("Red")
  end

  it "initializes attributes with string keys" do
    data = Fruit.new({ "name" => "Apple", "color" => "Red" })

    expect(data.name).to eq("Apple")
    expect(data.color).to eq("Red")
  end

  it "raises no method error if the attribute is not defined" do
    data = Fruit.new({ "name" => "Apple", "color" => "Red", "type" => "Fuji" })

    expect { data.type }.to raise_error(NoMethodError)
  end

  it "is equal to another value object with the same data" do
    orange1 = Fruit.new({ "name" => "Orange", "color" => "Orange" })
    orange2 = Fruit.new({ name: "Orange", color: "Orange" })

    expect(orange1).to eq(orange2)
  end

  it "is not equal to another value object with different data" do
    orange = Fruit.new({ "name" => "Orange", "color" => "Orange" })
    apple = Fruit.new({ "name" => "Apple", "color" => "Red" })

    expect(apple).to_not eq(orange)
  end

  it "can be converted to a hash" do
    apple = Fruit.new({ "name" => "Apple", "color" => "Red" })

    expect(apple.to_hash).to eq({
      name: "Apple",
      color: "Red"
    })
  end

  context "OpenValueObject" do
    it "defines all provided keys as attributes" do
      kiwi = OpenValueObject.new({ "name" => "Kiwi", "color" => "Green" })

      expect(kiwi.color).to eq("Green")
      expect(kiwi.name).to eq("Kiwi")
    end
  end
end
