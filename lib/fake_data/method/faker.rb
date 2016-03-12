module FakeData
  class Method
    class Faker < FakeData::Method
      FAKER_MATCH = /Faker/i

      private

      def raise_custom error, reason
        raise error, "FakeData: can't parse '#{raw}'. Reason: #{reason}. For usage see: https://github.com/stympy/faker"
      end

      def parse_klass klass_string
        raise_custom NameError, "missing faker class" unless klass_string
        klass = super(klass_string)
        klass = "::Faker#{klass}" unless klass =~ FAKER_MATCH
        klass
      end
    end
  end
end
