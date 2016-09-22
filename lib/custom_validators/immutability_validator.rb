module CustomValidators
  class ImmutabilityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if record.new_record?

      record.errors.add(attribute, :immutability) if record.public_send("#{attribute}_changed?")
    end
  end
end
