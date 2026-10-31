# RNA-seq Analysis – SRR5127206

## Learning period
October 30–31, 2026

## 1. Project organization
- Created RNA-seq project folders.
- Organized scripts, configuration files and results.
- Prepared an adapter reference file.

## 2. Quality Control – FastQC
- Ran FastQC on the original FASTQ file.
- Generated HTML and ZIP reports.
- Learned to interpret FastQC quality graphs.
- Studied per-base sequence quality, sequence content and adapter content.

## 3. Adapter Trimming – Trimmomatic
- Installed and used Trimmomatic.
- Created a trimming script: `02_trimming.sh`.
- Used single-end (SE) mode.
- Applied adapter clipping and quality trimming.

### Parameters used

- ILLUMINACLIP:2:30:10
- LEADING:3
- TRAILING:3
- SLIDINGWINDOW:4:15
- MINLEN:36

## 4. Post-trimming Quality Control
- Generated FastQC reports for trimmed reads.
- Compared original and trimmed Adapter Content graphs.
- Observed little or no visible change in adapter content.
- Further troubleshooting is required to verify adapter removal.

## 5. Tools
- Linux (WSL Ubuntu)
- SRA Toolkit
- FastQC
- Trimmomatic
- Git and GitHub
