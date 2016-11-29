require 'uri'

module CustomValidators
  class UrlValidator < ::ActiveModel::EachValidator
    DEFAULT_PROTOCOLS = [::URI::HTTP, ::URI::HTTPS].freeze

    def validate_each(record, attribute, value)
      record.errors.add(attribute, error_message) unless url_valid?(value)
    end

    private

    def url_valid?(url)
      options.fetch(:protocols, DEFAULT_PROTOCOLS).any? { |type| URI.parse(url).kind_of?(type) }
    rescue URI::InvalidURIError
      false
    end

    def error_message
      options.fetch(:message) do
        I18n.t('activerecord.errors.messages.url', default: 'must be valid URL')
      end
    end
  end
end
