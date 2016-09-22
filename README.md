CustomValidators

Additional validators: Email validator, Url validator, Immutability validator.

Usage:
  validates :my_email, :'custom_validators/email' => true
  validates :my_url, :'custom_validators/url' => true
  validates :field, :'custom_validators/immutability' => true
