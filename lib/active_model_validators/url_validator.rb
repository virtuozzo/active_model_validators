require 'uri'

module ActiveModelValidators #:nodoc:

  # == URL validator
  class UrlValidator < ::ActiveModel::EachValidator
    # Default protocols used for validation if no custom protocols provided
    #    DEFAULT_PROTOCOLS = [::URI::HTTP, ::URI::HTTPS]
    DEFAULT_PROTOCOLS = [::URI::HTTP, ::URI::HTTPS].freeze

    # Adds error if there is invalid URL address.
    #
    # By default it works with +http+ and +https+.
    #
    # It can be easily extended with protocols param
    #
    # * +record+ - ActiveRecord model
    # * +attr+   - model attribute to store an URL
    # * +value+  - value, supposed to be a valid URL-adress
    #
    # ==== Example
    #
    #   class MyModel < ActiveRecord::Base
    #     # default usage
    #     validates :my_url, :'active_model_validators/url' => true
    #   end
    #
    #   class MyModel < ActiveRecord::Base
    #     # with custom URL protocols
    #     validates :my_url, :'active_model_validators/url' => { protocols: [URI::HTTP, URI::HTTPS, URI::FTP] }
    #   end
    #
    #   valid_url = 'https://www.valid.com'
    #   my_model_instance = MyModel.create(my_url: valid_url)
    #   my_model_instance.valid? # => true
    #   my_model_instance.my_attribute = 'invalid_url'
    #   my_model_instance.valid? # => false
    def validate_each(record, attribute, value)
      record.errors.add(attribute, error_message) unless url_valid?(value)
    end

    private

    def url_valid?(url) #:nodoc:
      options.fetch(:protocols, DEFAULT_PROTOCOLS).any? { |type| URI.parse(url).kind_of?(type) }
    rescue URI::InvalidURIError
      false
    end

    def error_message #:nodoc:
      options.fetch(:message) do
        I18n.t('activerecord.errors.messages.url', default: 'must be valid URL')
      end
    end
  end
end
