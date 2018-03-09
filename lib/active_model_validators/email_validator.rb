module ActiveModelValidators #:nodoc:

  # == Email addresses validator
  class EmailValidator < ::ActiveModel::EachValidator

    # Regular expression used for validation
    #   EMAIL_ADDRESS_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    EMAIL_ADDRESS_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    # * +record+ - ActiveRecord model
    # * +attr+   - model attribute where email address will be stored
    # * +value+  - entered email address
    #
    # ==== Example
    #   class Model < ActiveRecord::Base
    #     validates :my_email, :'active_model_validators/email' => true
    #   end
    def validate_each(record, attr, value)
      unless value =~ EMAIL_ADDRESS_REGEX
        record.errors.add(attr, :invalid)
      end
    end
  end
end
