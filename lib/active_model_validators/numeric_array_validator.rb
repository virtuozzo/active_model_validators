module ActiveModelValidators #:nodoc:

  # == Validator of numerical array
  class NumericArrayValidator < ActiveModel::EachValidator

    # Adds error if there an attribute with not a numerical array provided
    #
    # * +record+ - ActiveRecord model
    # * +attr+   - model attribute to store an array
    # * +value+  - value, supposed to be a numerical array
    #
    # ==== Example
    #   class MyModel < ActiveRecord::Base
    #     validates :my_atribute, :'active_model_validators/numeric_array' => true
    #   end
    #
    #   my_model_instance = MyModel.create(my_attribute: [1,2,3])
    #   my_model_instance.valid? # => true
    #   my_model_instance.my_attribute = 'bar'
    #   my_model_instance.valid? # => false
    def validate_each(record, attribute, value)
      unless array_numeric?(value)
        record.errors.add(attribute, options[:message] || numeric_message)
      end
    end

    private

    def array_numeric?(values) #:nodoc:
      return false unless values.is_a? Array

      values.all? { |value| value.is_a?(Integer) && value > 0 }
    end

    def numeric_message #:nodoc:
      I18n.t(
        'activerecord.errors.messages.not_numeric_array',
        default: 'Should be an array of integers'
      )
    end
  end
end
