module ActiveModelValidators
  class ImmutabilityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if record.new_record?

      if record.public_send("#{attribute}_changed?")
        record.errors.add(attribute, :immutability)
      end
    end
  end
end
