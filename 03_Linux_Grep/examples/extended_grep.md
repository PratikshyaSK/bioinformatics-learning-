
# Extended Grep Practice Using Regular Expressions

## 1. Introduction

In Linux, `grep -E` is used to search text using Extended Regular Expressions (ERE).

Regular expressions allow us to search for more flexible patterns instead of only exact words.

In bioinformatics, this is useful for searching gene identifiers, sample IDs, numerical patterns, and other structured information.

## 2. Objective

The objective of this exercise is to learn how to:

- Search for multiple patterns at once.
- Use the OR operator (`|`).
- Search for numbers using `[0-9]`.
- Use quantifiers such as `+` and `{}`.
- Search for gene identifiers with a specific format.

## 3. Sample Dataset

For this exercise, I used `sample3.txt`.

### File content

```text
gene_001 is expressed
sample_001 passed quality control
plant_001 is healthy
gene_002 is not expressed
sample_002 failed quality control
soil_001 has high organic matter
```

To view the file, I used:

```bash
cat sample3.txt
```

## 4. Extended Grep Commands and Their Outputs

### 4.1 Searching for Multiple Patterns

**Command:**

```bash
grep -E "gene|sample" sample3.txt
```

**Output:**

```text
gene_001 is expressed
sample_001 passed quality control
gene_002 is not expressed
sample_002 failed quality control
```

**Explanation:**

- `grep`: Searches for matching text.
- `-E`: Enables Extended Regular Expressions.
- `gene|sample`: Searches for either `gene` OR `sample`.
- `sample3.txt`: The input file.

The pipe symbol (`|`) works as an OR operator.

Therefore, this command displays lines containing either `gene` or `sample`.

### 4.2 Searching for Three Different Patterns

**Command:**

```bash
grep -E "gene|sample|soil" sample3.txt
```

**Output:**

```text
gene_001 is expressed
sample_001 passed quality control
gene_002 is not expressed
sample_002 failed quality control
soil_001 has high organic matter
```

**Explanation:**

This command searches for three patterns:

- `gene`
- `sample`
- `soil`

A line is displayed if it contains at least one of these patterns.

The line containing `plant_001` is excluded because it does not contain any of the three patterns.

### 4.3 Searching for Numbers

**Command:**

```bash
grep -E "[0-9]+" sample3.txt
```

**Output:**

```text
gene_001 is expressed
sample_001 passed quality control
plant_001 is healthy
gene_002 is not expressed
sample_002 failed quality control
soil_001 has high organic matter
```

**Explanation:**

This command searches for lines containing one or more digits.

- `[0-9]`: Matches any digit from 0 to 9.
- `+`: Matches one or more occurrences of the preceding pattern.

All six lines contain numerical identifiers, so all six lines are displayed.

### 4.4 Searching for Gene Identifiers

**Command:**

```bash
grep -E "gene_[0-9]{3}" sample3.txt
```

**Output:**

```text
gene_001 is expressed
gene_002 is not expressed
```

**Explanation:**

This regular expression searches for gene identifiers containing:

- `gene_`: The fixed text.
- `[0-9]`: Any digit from 0 to 9.
- `{3}`: Exactly three repetitions of the preceding digit pattern.

Therefore, the command finds identifiers such as `gene_001` and `gene_002`.

Note: This pattern matches the first three digits even if additional digits follow them. It is sufficient for the identifiers in this practice dataset.

## 5. Summary of Regular Expression Symbols

| Symbol | Meaning | Example |
|---|---|---|
| `-E` | Enables extended regular expressions | `grep -E` |
| `|` | OR operator | `gene|sample` |
| `[0-9]` | Matches any digit | `[0-9]` |
| `+` | One or more occurrences | `[0-9]+` |
| `{3}` | Exactly three repetitions | `[0-9]{3}` |

## 6. What I Learned

Through this exercise, I learned how to use Extended Regular Expressions with grep.

I practised searching for multiple patterns, identifying numerical values, and finding gene identifiers with a specific format.

These techniques are useful when analysing structured biological data and searching through bioinformatics files.

## 7. Conclusion

This exercise improved my understanding of regular expressions in Linux and demonstrated how `grep -E` can make text searching more flexible and efficient.
