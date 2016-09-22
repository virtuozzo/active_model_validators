module CustomValidators
  class EmailValidator < ::ActiveModel::EachValidator
    EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    def validate_each(record, attr, value)
      unless value =~ EMAIL_REGEXP
        record.errors.add(attr, :invalid)
      end
    end
  end
end
