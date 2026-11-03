
## 1. Project Overview

This project documents my hands-on learning of Linux `grep` commands and their applications in bioinformatics.

I practised searching text files, filtering matching lines, counting matches, using regular expressions, and searching DNA sequences in FASTQ files.

The project was developed using Linux on WSL with a sample RNA-seq dataset.

Grep is also useful in bioinformatics for searching gene IDs,sample names,specific sequence, and errors in log files.

This preserves the useful information from your original README.

## 2. Tools Used

- Linux (WSL)
- grep
- awk
- Bash
- FASTQ sequencing data

## 3. Basic Grep Commands

### 3.1 Search for a specific word

```bash
grep "gene" sample.txt
```

Searches for lines containing the word `gene`. The search is case-sensitive.

### 3.2 Case-insensitive search

```bash
grep -i "gene" sample.txt
```

Searches for `gene` without considering uppercase or lowercase letters.

### 3.3 Display line numbers

```bash
grep -n "gene" sample.txt
```

Displays matching lines along with their line numbers.

### 3.4 Inverse search

```bash
grep -v "gene" sample.txt
```

Displays lines that do not contain the specified pattern.

### 3.5 Case-insensitive inverse search

```bash
grep -iv "gene" sample.txt
```

Displays lines that do not contain `gene`, regardless of uppercase or lowercase letters.

### 3.6 Count matching lines

```bash
grep -c "gene" sample.txt
```

Counts the number of lines containing the specified pattern.

### 3.7 Case-insensitive counting

```bash
grep -ic "gene" sample.txt
```

Counts matching lines without considering uppercase or lowercase differences.

### 3.8 Whole-word search

```bash
grep -w "gene" sample.txt
```

Searches for the complete word `gene` rather than matching it as part of another word.

### 3.9 Limit the number of matching lines

```bash
grep -m 5 "GGTGCCAA" ~/SRR5127206.fastq
```

Displays a maximum of five matching lines and stops searching after reaching the limit.

## 4. Extended Regular Expressions

The `-E` option enables extended regular expressions.

### 4.1 Search for multiple patterns

```bash
grep -E "gene|sample" sample.txt
```

Searches for lines containing either `gene` OR `sample`.

The pipe symbol `|` represents OR.

### 4.2 Search for a pattern containing digits

```bash
grep -E "gene_[0-9]{3}" sample.txt
```

Here:

- `[0-9]` represents any digit from 0 to 9.
- `{3}` means exactly three consecutive digits.

For example, it matches `gene_001`.

## 5. FASTQ File Analysis Using Grep

I practised searching for a specific DNA sequence in an RNA-seq FASTQ file.

Dataset: `SRR5127206.fastq`

### 5.1 Understanding FASTQ structure

Each FASTQ read contains four lines:

1. Read identifier (header)
2. DNA sequence
3. Separator (+)
4. Quality scores

### 5.2 Search for a DNA sequence using grep

```bash
grep -m 5 "GGTGCCAA" ~/SRR5127206.fastq
```

Searches the FASTQ file for the sequence `GGTGCCAA` and displays up to five matching lines.

Note: Grep searches all lines of the FASTQ file, including headers and quality scores.

### 5.3 Search only DNA sequence lines using awk

```bash
awk 'NR%4==2 && /GGTGCCAA/' ~/SRR5127206.fastq | head -n 5
```

This command searches only the DNA sequence lines.

Explanation:

- `NR` represents the current line number.
- `%` calculates the remainder after division.
- `NR%4==2` selects lines 2, 6, 10, 14, and so on.
- `/GGTGCCAA/` searches for the specified DNA sequence.
- `head -n 5` displays the first five matching lines.

### 5.4 Difference between grep and awk

| Command | Function |
|---|---|
| grep | Searches all lines in the FASTQ file |
| awk | Selects DNA sequence lines before searching |

Using `awk` helps avoid matching the pattern in FASTQ headers or quality-score lines.

## 6. Bash Script for FASTQ Sequence Searching

I created and tested a Bash script to automate the FASTQ search.

Script location: `examples/grep_fastq.sh`

Run the script using:

```bash
chmod +x examples/grep_fastq.sh
./examples/grep_fastq.sh
```

The script performs two operations:

1. Searches all FASTQ lines using grep.
2. Searches only DNA sequence lines using awk.

## 7. Key Learnings

Through this project, I learned:

- How to search for specific words and patterns in text files.
- How to use different grep options.
- How to perform case-insensitive and inverse searches.
- How to count matching lines.
- How to use extended regular expressions.
- How to understand the four-line structure of FASTQ files.
- How to search for DNA sequences using grep and awk.
- How to write and execute a simple Bash script.

## 8. Project Structure

```text
03_Linux_Grep/
├── README.md
├── sample.txt
├── sample2.txt
├── sample3.txt
└── examples/
    └── grep_fastq.sh

9. Conclusion

This project helped me develop practical Linux command-line skills and understand how text-searching tools can be applied to biological sequencing data. It is part of my ongoing bioinformatics learning journey.

## 1. Project Overview

This project documents my hands-on learning of Linux `grep` commands and their applications in bioinformatics.

I practised searching text files, filtering matching lines, counting matches, using regular expressions, and searching DNA sequences in FASTQ files.

The project was developed using Linux on WSL with a sample RNA-seq dataset.

## 2. Tools Used

- Linux (WSL)
- grep
- awk
- Bash
- FASTQ sequencing data

## 3. Basic Grep Commands

### 3.1 Search for a specific word

```bash
grep "gene" sample.txt
```

Searches for lines containing the word `gene`. The search is case-sensitive.

### 3.2 Case-insensitive search

```bash
grep -i "gene" sample.txt
```

Searches for `gene` without considering uppercase or lowercase letters.

### 3.3 Display line numbers

```bash
grep -n "gene" sample.txt
```

Displays matching lines along with their line numbers.

### 3.4 Inverse search

```bash
grep -v "gene" sample.txt
```

Displays lines that do not contain the specified pattern.

### 3.5 Case-insensitive inverse search

```bash
grep -iv "gene" sample.txt
```

Displays lines that do not contain `gene`, regardless of uppercase or lowercase letters.

### 3.6 Count matching lines

```bash
grep -c "gene" sample.txt
```

Counts the number of lines containing the specified pattern.

### 3.7 Case-insensitive counting

```bash
grep -ic "gene" sample.txt
```

Counts matching lines without considering uppercase or lowercase differences.

### 3.8 Whole-word search

```bash
grep -w "gene" sample.txt
```

Searches for the complete word `gene` rather than matching it as part of another word.

### 3.9 Limit the number of matching lines

```bash
grep -m 5 "GGTGCCAA" ~/SRR5127206.fastq
```

Displays a maximum of five matching lines and stops searching after reaching the limit.

## 4. Extended Regular Expressions

The `-E` option enables extended regular expressions.

### 4.1 Search for multiple patterns

```bash
grep -E "gene|sample" sample.txt
```

Searches for lines containing either `gene` OR `sample`.

The pipe symbol `|` represents OR.

### 4.2 Search for a pattern containing digits

```bash
grep -E "gene_[0-9]{3}" sample.txt
```

Here:

- `[0-9]` represents any digit from 0 to 9.
- `{3}` means exactly three consecutive digits.

For example, it matches `gene_001`.

## 5. FASTQ File Analysis Using Grep

I practised searching for a specific DNA sequence in an RNA-seq FASTQ file.

Dataset: `SRR5127206.fastq`

### 5.1 Understanding FASTQ structure

Each FASTQ read contains four lines:

1. Read identifier (header)
2. DNA sequence
3. Separator (+)
4. Quality scores

### 5.2 Search for a DNA sequence using grep

```bash
grep -m 5 "GGTGCCAA" ~/SRR5127206.fastq
```

Searches the FASTQ file for the sequence `GGTGCCAA` and displays up to five matching lines.

Note: Grep searches all lines of the FASTQ file, including headers and quality scores.

### 5.3 Search only DNA sequence lines using awk

```bash
awk 'NR%4==2 && /GGTGCCAA/' ~/SRR5127206.fastq | head -n 5
```

This command searches only the DNA sequence lines.

Explanation:

- `NR` represents the current line number.
- `%` calculates the remainder after division.
- `NR%4==2` selects lines 2, 6, 10, 14, and so on.
- `/GGTGCCAA/` searches for the specified DNA sequence.
- `head -n 5` displays the first five matching lines.

### 5.4 Difference between grep and awk

| Command | Function |
|---|---|
| grep | Searches all lines in the FASTQ file |
| awk | Selects DNA sequence lines before searching |

Using `awk` helps avoid matching the pattern in FASTQ headers or quality-score lines.

## 6. Bash Script for FASTQ Sequence Searching

I created and tested a Bash script to automate the FASTQ search.

Script location: `examples/grep_fastq.sh`

Run the script using:

```bash
chmod +x examples/grep_fastq.sh
./examples/grep_fastq.sh
```

The script performs two operations:

1. Searches all FASTQ lines using grep.
2. Searches only DNA sequence lines using awk.

## 7. Key Learnings

Through this project, I learned:

- How to search for specific words and patterns in text files.
- How to use different grep options.
- How to perform case-insensitive and inverse searches.
- How to count matching lines.
- How to use extended regular expressions.
- How to understand the four-line structure of FASTQ files.
- How to search for DNA sequences using grep and awk.
- How to write and execute a simple Bash script.

## 8. Project Structure

```text
03_Linux_Grep/
├── README.md
├── sample.txt
├── sample2.txt
├── sample3.txt
└── examples/
    └── grep_fastq.sh
9. Conclusion

This project helped me develop practical Linux command-line skills and understand how text-searching tools can be applied to biological sequencing data. It is part of my ongoing bioinformatics learning journey.
