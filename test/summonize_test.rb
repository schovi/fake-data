require 'test_helper'

describe FakeData do
  before do
    # Faker::Name.stub :name do
    #   "John Doe"
    # end
    #
    # Faker::Number.stub :number, 4 do
    #   1234
    # end
    #
    # Faker::Color.stub :hex_color do
    #   "#123456"
    # end
    #
    # Faker::Email.stub :email do
    #   "john@doe.com"
    # end
    #
    # Faker::Email.stub :email, "jane" do
    #   "jane@doe.com"
    # end
  end

  it "test_static_value" do
    FakeData.once("static")
  end

  it "test_faker_name" do
    FakeData.once("aaa %{name.name}")
  end

  it "test_concatenate_faker_with_text" do
    FakeData.once("name: %{name.name}")
  end

  it "test_generator" do
    generator = FakeData.generator("%{name.name}")

    10.times do
      generator.call
    end
  end

  it "test_debug" do
    FakeData.debug("%{name.name}")
  end

  it "test_array" do
    FakeData.once(["%{name.name}", "%{number.number(4)}"])
  end

  it "test_hash" do
    FakeData.once({
      string: "%{name.name}",
      number: "%{number.number(4)}",
      another_hash: {
        hex_color: "%{color.hex_color}",
        array_with_hash: [
          {
            email: "%{internet.email}"
          },
          {
            email: "%{internet.email('jane')}"
          }
        ]
      }
    })
  end

  it "test_maybe" do
    FakeData.once({"%{maybe}": "%{name.name}"})
  end

  it "test_maybe_with_probability" do
    FakeData.once({"%{maybe(10)}": "%{name.name}"})
  end

  it "test_repeat" do
    FakeData.once({"%{repeat(2)}": "%{name.name}"})
  end

  it "test_repeat_with_random_count" do
    FakeData.once({"%{repeat(1..10)}": "%{name.name}"})
  end

  it "test_maybe_with_repeat" do
    FakeData.once({
      "%{maybe}": {
        "%{repeat(2)}": "%{name.name}"
      }
    })
  end

  # TODO
  # it "test_native_method" do
  #   FakeData.once("%{rand}")
  # end
end
