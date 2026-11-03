#!/bin/bash

# Search for a DNA sequence in a FASTQ file

FASTQ_FILE="$HOME/SRR5127206.fastq"
PATTERN="GGTGCCAA"

echo "Searching all FASTQ lines:"
grep -m 5 "$PATTERN" "$FASTQ_FILE"

echo "Searching only DNA sequence lines:"
awk -v pattern="$PATTERN" 'NR%4==2 && index($0, pattern)' "$FASTQ_FILE" | head -n 5
