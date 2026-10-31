#!/bin/bash

# ==========================================
# RNA-seq Pipeline: Trimmomatic
# Sample: SRR5127206
# ==========================================

# Input FASTQ file
INPUT="$HOME/SRR5127206.fastq"

# Adapter file
ADAPTER="config/adapters/TruSeq3-SE.fa"

# Output directory
OUTPUT="results/trimmed_reads"

# Create output directory
mkdir -p "$OUTPUT"

# Run Trimmomatic
trimmomatic SE \
-phred33 \
"$INPUT" \
"$OUTPUT/SRR5127206_trimmed.fastq" \
ILLUMINACLIP:"$ADAPTER":2:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:4:15 \
MINLEN:36

echo "Trimmomatic analysis completed!"

