module ActiveModelValidators
  class NumericArrayValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless array_numeric?(value)
        record.errors.add(attribute, options[:message] || numeric_message)
      end
    end

    private

    def array_numeric?(values)
      return false unless values.is_a? Array

      values.all? { |value| value.is_a?(Integer) && value > 0 }
    end

    def numeric_message
      I18n.t(
        'activerecord.errors.messages.not_numeric_array',
        default: 'Should be an array of integers'
      )
    end
  end
end
