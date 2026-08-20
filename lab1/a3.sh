#!/bin/bash

OUTPUT_FILE="outputFile.txt"

if [ $# -eq 0 ]; then
    echo "Error: No command provided."
    echo "Usage: $0 <command>"
    exit 1
fi


"$@" 2>&1 | tee "$OUTPUT_FILE"

echo "Output saved to $OUTPUT_FILE"
