module ActiveModelValidators #:nodoc:

  # == Attributes immutability validator
  class ImmutabilityValidator < ActiveModel::EachValidator

    # Adds error if there an attempt to change an immutable attribute
    #
    # * +record+ - ActiveRecord model
    # * +attr+   - model attribute which is supposed to be immutable
    # * +value+  - value
    #
    # ==== Example
    #   class Model < ActiveRecord::Base
    #     validates :my_atribute, :'active_model_validators/immutability' => true
    #   end
    #
    #   my_model_instance = MyModel.create(my_attribute: 'foo')
    #   my_model_instance.my_attribute = 'bar'
    #   my_model_instance.valid? # => false
    def validate_each(record, attribute, value)
      return if record.new_record?

      if record.public_send("#{attribute}_changed?")
        record.errors.add(attribute, :immutability)
      end
    end
  end
end
