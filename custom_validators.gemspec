$:.push File.expand_path('../lib', __FILE__)

require 'custom_validators/version'

Gem::Specification.new do |s|
  s.name        = 'custom_validators'
  s.version     = CustomValidators::VERSION
  s.authors     = ['OnApp devs']
  s.email       = %w( onapp@onapp.com )
  s.summary     = 'CustomValidators'
  s.description = 'OnApp Custom validators.'

  s.files = Dir['{app,config,db,lib}/**/*'] + %w( README.md )

  s.add_dependency 'activemodel', '3.2.22'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
end
