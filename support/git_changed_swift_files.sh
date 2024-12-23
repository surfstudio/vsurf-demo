#!/bin/bash

# Script writes all swift files that have changed from last commit except for deleted once
{ git diff --name-only --diff-filter=AM ; git diff --name-only --diff-filter=AM --staged ; git ls-files --other --exclude-standard ; } | sort | uniq | grep '\.swift$'
