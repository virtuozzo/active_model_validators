#!/bin/bash

echo "*** Running active_model_validators specs"

bundle install         || exit 1
bundle exec rspec spec || exit 1
