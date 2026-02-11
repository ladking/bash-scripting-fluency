#!/bin/bash


echo "Keyword Finder"

if [ $# != 2 ]; then
    echo "You have to provide directory and search keyworld as arguments"
    echo "Example: ./search_keyword.sh <directory> <keyword>"
else
    echo "Search for keyword: $2 in Directory Path: $1"
    return 0
fi