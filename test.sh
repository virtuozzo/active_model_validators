#!/bin/bash

echo "*** Running custom_validators specs"

bundle install         || exit 1
bundle exec rspec spec || exit 1
