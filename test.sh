#!/bin/bash

echo "*** Running active_model_validators specs"

bundle install
bundle exec rspec spec
