$:.push File.expand_path('../lib', __FILE__)

require 'active_model_validators/version'

Gem::Specification.new do |s|
  s.name        = 'active_model_validators'
  s.description = 'OnApp ActiveModel validators.'
  s.version     = ActiveModelValidators::VERSION
  s.author      = 'OnApp Ltd.'
  s.email       = 'support@onapp.com'
  # s.homepage    = 'TODO'
  s.summary     = 'A small handy library to validate active_record models'
  s.license     = 'Apache 2.0'
  s.files       = Dir['lib/**/*'] + %w( Rakefile README.md LICENSE)
  s.required_ruby_version = '>= 2.2.0'

  s.add_dependency 'activemodel'

  s.add_development_dependency 'rspec'
end
