#!/bin/bash
set -u  # this will give us a warning every time we use undeclared variable 

echo "::set-output name=release-url::http://example.com"

exit 0