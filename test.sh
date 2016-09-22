#!/bin/bash

exit_code=0

echo "*** Running custom_validators specs"
bundle exec rspec spec
exit_code+=$?

exit $exit_code
