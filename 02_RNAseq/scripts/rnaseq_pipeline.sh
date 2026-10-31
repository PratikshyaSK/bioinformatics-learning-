#!/bin/bash

set -euo pipefail

# ==========================================================
# RNA-seq Analysis Pipeline
# Author: Pratikshya Subedi
# Description: Automated RNA-seq data quality control,
#              read alignment, and gene expression analysis.
# ==========================================================

# Project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Input and output directories
RAW_DIR="$PROJECT_DIR/raw_data"
RESULTS_DIR="$PROJECT_DIR/results"
LOG_DIR="$PROJECT_DIR/logs"


# Create required directories if they do not exist
mkdir -p "$RAW_DIR" "$RESULTS_DIR" "$LOG_DIR"

# Create a log file for this pipeline run
LOG_FILE="$LOG_DIR/pipeline_$(date +%Y%m%d_%H%M%S).log"

# Save terminal output to both screen and log file
exec > >(tee -a "$LOG_FILE") 2>&1

# Display messages with date and time
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}
