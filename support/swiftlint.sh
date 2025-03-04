#!/bin/bash

# Script runs SwiftLint for all .swift files

if [ $# -ne 1 ]; then
    echo "Usage: $0 <root dir>"
    exit 1
fi

# Go to the root dir
cd $1

LINT="tools/swiftlint-v0_54_0"
LINT_CONFIG=".swiftlint.yml"
DIR_TO_LINT="Modules/"

# Run SwiftLint
$LINT lint $DIR_TO_LINT --config $LINT_CONFIG 
