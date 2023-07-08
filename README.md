<!-- [gem]: [TODO] -->

# ActiveModelValidators

<!-- [![Gem Version](TODO)][gem] -->

### Installation
Add the following code to your `Gemfile`

```ruby
# Gemfile
gem 'active_model_validators'
```
and run `bundle install`

### Incuded validators:
  Email validator, Url validator, Immutability validator, NumericArray validator.

### Usage

```ruby
class Model < ActiveRecord::Base
  validates :my_email, :'active_model_validators/email' => true
  # my_model_instance = MyModel.create(my_email: 'valid@email.com')
  # my_model_instance.valid? # => true
  # my_model_instance.my_email = 'invalid email'
  # my_model_instance.valid? # => false

  validates :my_immutable_attribute, :'active_model_validators/immutability' => true
  # my_model_instance = MyModel.create(my_immutable_attribute: 'foo')
  # my_model_instance.my_immutable_attribute = 'bar'
  # my_model_instance.valid? # => false

  validates :my_attribute_with_array, :'active_model_validators/numeric_array' => true
  # my_model_instance = MyModel.create(my_attribute_with_array: [1,2,3])
  # my_model_instance.valid? # => true
  # my_model_instance.my_attribute_with_array = 'I am not an array'
  # my_model_instance.valid? # => false

  validates :my_url_attribue, :'active_model_validators/url' => true
  # by default it works with +http+ and +https+
  # It can be easily extended with +protocols+ param
  # :'active_model_validators/url' => { protocols: [URI::HTTP, URI::HTTPS, URI::FTP] }
  # valid_url = 'https://www.valid.com'
  # my_model_instance = MyModel.create(my_url_attribue: valid_url)
  # my_model_instance.valid? # => true
  # my_model_instance.my_url_attribue = 'invalid url'
  # my_model_instance.valid? # => false
end
```

### Licence
See [`LICENSE`](LICENSE) file.
