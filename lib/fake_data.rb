require "faker"
require "fake_data/version"
require "fake_data/structure"
require "fake_data/method"

# This is required. Sometimes Faker throws error on missing locale.
I18n.reload!

module FakeData
  class << self
    def locale=(locale)
      Faker::Config.locale = locale
    end

    def once object
      generator(object).call
    end

    def generator object
      Structure.object_to_lambda(object)
    end

    def debug object
      Structure.object_to_source(object)
    end
  end
end
