
# FASTQ Sequence Searching Using Linux Grep and AWK

## 1. Introduction

FASTQ is a common file format used to store biological sequencing data. It contains DNA or RNA sequences along with their corresponding quality scores.

In bioinformatics, searching for a specific DNA sequence within a large FASTQ file is a useful task.

In this exercise, I used Linux commands such as `head`, `grep`, and `awk` to explore a FASTQ file and search for a specific DNA sequence.

## 2. Objective

The objectives of this exercise are to:

- Understand the structure of a FASTQ file.
- Explore sequencing data using Linux commands.
- Search for a specific DNA sequence using grep.
- Limit search results using `-m`.
- Search only DNA sequence lines using awk.
- Automate sequence searching using a Bash script.

## 3. Dataset Information

For this exercise, I used the FASTQ dataset:

`SRR5127206.fastq`

The file was approximately 2.5 GB in size and contained sequencing reads of 51 bases.

The file was stored in my home directory.

## 4. Understanding FASTQ File Structure

A FASTQ record consists of four lines:

1. Header: Begins with `@` and contains the read identifier.
2. Sequence: Contains the DNA or RNA sequence.
3. Separator: Begins with `+`.
4. Quality: Contains quality scores corresponding to the sequence.

### Example FASTQ record

```text
@SRR5127206.1 1 length=51
NTTTCCGTAGTGTAGTGGTTATCACGTTCGCCTGGAATTCTCGGGTGCCAA
+SRR5127206.1 1 length=51
#00<BFFFFFFBFFBFFBBFFFFFFBFFIFFFFFFFFFIIIFFFFFFFFFF
```

The second line contains the nucleotide sequence.

The fourth line contains quality information for the bases.

The letter `N` in a sequence indicates an unknown or undetermined nucleotide.

## 5. Exploring the FASTQ File

### 5.1 Viewing the First Eight Lines

**Command:**

```bash
head -n 8 ~/SRR5127206.fastq
```

**Purpose:**

The `head` command displays the beginning of a file.

The `-n 8` option displays the first eight lines.

Since each FASTQ record contains four lines, the first eight lines represent two complete sequencing records.

## 6. Searching for a Specific DNA Sequence Using Grep

I selected the DNA sequence:

`GGTGCCAA`

### 6.1 Searching for the Sequence

**Command:**

```bash
grep "GGTGCCAA" ~/SRR5127206.fastq
```

**Purpose:**

This command searches the entire FASTQ file for lines containing the specified DNA sequence.

Since FASTQ files are large, displaying every match can produce a huge amount of output.

### 6.2 Limiting the Search Results

**Command:**

```bash
grep -m 5 "GGTGCCAA" ~/SRR5127206.fastq
```

**Output:**

```text
NTTTCCGTAGTGTAGTGGTTATCACGTTCGCCTGGAATTCTCGGGTGCCAA
NAGCTGCCAGTTGAAGAACTGTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NACGCCTGTCTGAGCGTCGCTTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NTCAAGTAATCCAGGATAGGCTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NAGCTGCCAGTTGAAGAACTGTTGGAATTCTCGGGTGCCAAGGAACTCCAG
```

**Explanation:**

- `grep`: Searches for a pattern.
- `-m 5`: Stops after finding five matching lines.
- `"GGTGCCAA"`: The DNA sequence being searched.
- `~/SRR5127206.fastq`: The input FASTQ file.

This command searches all lines in the FASTQ file, not only the DNA sequence lines.

## 7. Searching Only DNA Sequence Lines Using AWK

A FASTQ file contains four lines per sequencing record.

The DNA sequence is always located on the second line of each record.

Therefore, I used AWK to search only the sequence lines.

**Command:**

```bash
awk 'NR%4==2 && /GGTGCCAA/' ~/SRR5127206.fastq | head -n 5
```

**Output:**

```text
NTTTCCGTAGTGTAGTGGTTATCACGTTCGCCTGGAATTCTCGGGTGCCAA
NAGCTGCCAGTTGAAGAACTGTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NACGCCTGTCTGAGCGTCGCTTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NTCAAGTAATCCAGGATAGGCTTGGAATTCTCGGGTGCCAAGGAACTCCAG
NAGCTGCCAGTTGAAGAACTGTTGGAATTCTCGGGTGCCAAGGAACTCCAG
```

**Explanation:**

- `awk`: Processes text line by line.
- `NR`: Represents the current input line number.
- `%4`: Calculates the remainder after division by four.
- `NR%4==2`: Selects the second line of every FASTQ record.
- `/GGTGCCAA/`: Searches for the selected DNA sequence.
- `head -n 5`: Displays the first five matching lines.

This method searches only the DNA sequence lines instead of searching all four lines of each FASTQ record.

## 8. Comparing Grep and AWK

| Feature | Grep | AWK |
|---|---|---|
| Main purpose | Search for patterns | Process structured text |
| FASTQ search | Searches all lines | Can select specific FASTQ lines |
| Sequence-specific search | Requires additional filtering | Can select sequence lines using `NR%4==2` |
| Useful option | `-m 5` | `NR%4==2` |

Both commands are useful, but AWK provides more control when working with structured sequencing files.

## 9. Automating the Search Using a Bash Script

After practising the commands individually, I created a Bash script to automate the search.

### Script location

`examples/grep_fastq.sh`

### Script content

```bash
#!/bin/bash

# Search for a DNA sequence in a FASTQ file

FASTQ_FILE="$HOME/SRR5127206.fastq"
PATTERN="GGTGCCAA"

echo "Searching all FASTQ lines:"
grep -m 5 "$PATTERN" "$FASTQ_FILE"

echo "Searching only DNA sequence lines:"
awk -v pattern="$PATTERN" 'NR%4==2 && index($0, pattern)' "$FASTQ_FILE" | head -n 5
```

### Explanation of the script

- `#!/bin/bash`: Specifies Bash as the interpreter.
- `FASTQ_FILE`: Stores the location of the FASTQ file.
- `PATTERN`: Stores the DNA sequence to search for.
- `echo`: Displays messages in the terminal.
- `grep -m 5`: Displays up to five matching lines from the entire file.
- `awk -v pattern="$PATTERN"`: Passes the selected DNA sequence to AWK.
- `index($0, pattern)`: Checks whether the current line contains the DNA sequence.
- `NR%4==2`: Selects only DNA sequence lines.
- `head -n 5`: Limits the displayed output to five lines.

### Running the script

First, I made the script executable:

```bash
chmod +x examples/grep_fastq.sh
```

Then, I executed it:

```bash
./examples/grep_fastq.sh
```

The script successfully displayed matching lines from the FASTQ file using both grep and AWK.

**Note:** The script expects `SRR5127206.fastq` to be located in the user's home directory. The file path must be adjusted if the dataset is stored elsewhere.

## 10. What I Learned

Through this exercise, I learned:

- The four-line structure of FASTQ files.
- How to explore sequencing files using Linux commands.
- How to search for DNA sequences using grep.
- How to limit terminal output using `head` and `grep -m`.
- How to use AWK to select only sequence lines.
- How to automate repetitive tasks using Bash scripts.

## 11. Conclusion

This exercise provided practical experience in searching and processing sequencing data using Linux.

By combining grep, AWK, and Bash scripting, I learned how to perform targeted sequence searches in a large FASTQ file.

These skills provide a useful foundation for more advanced bioinformatics analyses.
