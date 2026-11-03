
# Basic Linux Grep Practice

## 1. Introduction

The `grep` command is used in Linux to search for specific words, patterns, or text inside files.

In bioinformatics, grep is useful for searching gene IDs, sample names, DNA sequences, and errors in log files.

## 2. Objective

The objective of this exercise is to learn how to:

- Search for specific words in a text file.
- Perform case-insensitive searches.
- Display line numbers.
- Exclude matching lines.
- Count matching lines.
- Search for whole words.

## 3. Sample Dataset

For this exercise, I created a text file named `sample.txt`.

### File content

```text
gene_001 is expressed
gene_002 is not expressed
sample_001 passed quality control
gene_003 is expressed
sample_002 failed quality control
Gene_004 is expressed
GENE_005 is not expressed
```

To view the contents of the file, I used:

```bash
cat sample.txt
```

## 4. Grep Commands and Their Outputs

### 4.1 Basic Search

**Command:**

```bash
grep "gene" sample.txt
```

**Output:**

```text
gene_001 is expressed
gene_002 is not expressed
gene_003 is expressed
```

**Explanation:**

This command searches for the lowercase word `gene` and displays every line containing that text.

The search is case-sensitive, so `Gene` and `GENE` are not included.

### 4.2 Case-Insensitive Search

**Command:**

```bash
grep -i "gene" sample.txt
```

**Output:**

```text
gene_001 is expressed
gene_002 is not expressed
gene_003 is expressed
Gene_004 is expressed
GENE_005 is not expressed
```

**Explanation:**

The `-i` option ignores uppercase and lowercase differences.

Therefore, it finds `gene`, `Gene`, and `GENE`.

### 4.3 Displaying Line Numbers

**Command:**

```bash
grep -n "gene" sample.txt
```

**Output:**

```text
1:gene_001 is expressed
2:gene_002 is not expressed
4:gene_003 is expressed
```

**Explanation:**

The `-n` option displays the line number alongside each matching line.

This helps identify the exact location of information in a file.

### 4.4 Excluding Matching Lines

**Command:**

```bash
grep -v "gene" sample.txt
```

**Output:**

```text
sample_001 passed quality control
sample_002 failed quality control
Gene_004 is expressed
GENE_005 is not expressed
```

**Explanation:**

The `-v` option displays lines that do not contain the specified pattern.

Since the search is case-sensitive, uppercase variations remain in the output.

### 4.5 Excluding Matches Regardless of Case

**Command:**

```bash
grep -iv "gene" sample.txt
```

**Output:**

```text
sample_001 passed quality control
sample_002 failed quality control
```

**Explanation:**

Here, two options are combined:

- `-i`: Ignores uppercase and lowercase differences.
- `-v`: Excludes matching lines.

Therefore, all lines containing `gene` in any letter case are excluded.

### 4.6 Counting Matching Lines

**Command:**

```bash
grep -c "gene" sample.txt
```

**Output:**

```text
3
```

**Explanation:**

The `-c` option counts the number of lines containing the specified pattern.

There are three lines containing lowercase `gene`.

### 4.7 Counting Matches Without Case Sensitivity

**Command:**

```bash
grep -ic "gene" sample.txt
```

**Output:**

```text
5
```

**Explanation:**

The `-i` and `-c` options are combined.

This counts all lines containing `gene`, regardless of uppercase or lowercase letters.

### 4.8 Searching for a Whole Word

**Command:**

```bash
grep -w "gene" sample.txt
```

**Output:**

```text
```

**Explanation:**

The `-w` option searches for a complete word rather than a matching part of a longer word.

There is no standalone `gene` in this dataset. The text contains identifiers such as `gene_001`.

The underscore is treated as a word character, so these identifiers do not match the whole-word search.

## 5. Summary of Commands

| Command | Purpose |
|---|---|
| `grep "gene" sample.txt` | Search for lowercase gene |
| `grep -i "gene" sample.txt` | Ignore letter case |
| `grep -n "gene" sample.txt` | Display line numbers |
| `grep -v "gene" sample.txt` | Exclude matching lines |
| `grep -iv "gene" sample.txt` | Exclude matches regardless of case |
| `grep -c "gene" sample.txt` | Count matching lines |
| `grep -ic "gene" sample.txt` | Count matches regardless of case |
| `grep -w "gene" sample.txt` | Search for a whole word |

## 6. What I Learned

Through this exercise, I learned how to use different grep options to search, filter, and count information in Linux text files.

These commands are useful in bioinformatics when working with gene identifiers, sample information, sequencing data, and other text-based files.

## 7. Conclusion

This exercise helped me understand the basic functionality of the Linux `grep` command and how its options can make text searching more efficient.
