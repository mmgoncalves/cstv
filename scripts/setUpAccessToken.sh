#!/bin/bash

function show_usage {
    echo "Usage: $0 -token <variable>"
}

if [ $# -ne 2 ]; then
    show_usage
    exit 1
fi

while [ $# -gt 0 ]; do
    case "$1" in
        -token)
            variable_name="$2"
            shift 2 ;;
        *)
            show_usage
            exit 1 ;;
    esac
done

if [ -z "$variable_name" ]; then
    show_usage
    exit 1
fi

file_name="./CSTV/Utils/Constants.swift"
echo "import Foundation

enum Constants {
    static let API_ACCESS_TOKEN = \"${variable_name}\"
}" > "$file_name"

echo "Variable '$variable_name' written to file '$file_name'."
