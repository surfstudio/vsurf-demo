#!/bin/bash

# Script runs SwiftFormat for swift files that have changed since last commit

if [ $# -ne 1 ]; then
    echo "Usage: $0 <root dir>"
    exit 1
fi

# Go to the root dir
cd $1

FORMATTER="tools/swiftformat-0.54.1"
CHANGED_FILES="support/git_changed_swift_files.sh"

FILELIST=".filelist_swiftformat"
$CHANGED_FILES > $FILELIST

if [ ! -s $FILELIST ]; then
    rm $FILELIST
    echo "Finished: no files to format."
    exit 0
fi

# Run formatter
$FORMATTER -filelist $FILELIST

# Remove temp file
rm $FILELIST
