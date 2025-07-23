## tableR Workflow

- [Introduction](#introduction)
- [Step 1 - Provide the Data](#step-1---provide-the-data)
- [Step 2 - Format the Table](#step-2---format-the-table)
- [Step 3 - Style the Table](#step-3---style-the-table)
- [Step 4 - Save the Output](#step-4---save-the-output)
- [Addendum - Working with Other Data
  Types](#addendum---working-with-other-data-types)

------------------------------------------------------------------------

### Introduction

The `tableR` package provides a simple, structured workflow to create
formatted and styled tables in R. The workflow follows this progression:

1.  **df** - Provide the data
2.  **format** - Format the content
3.  **style** - Apply styling for output
4.  **print** - Display or save the table

This modular workflow is ideal for clean, readable, and reproducible
tables.

### Step 1 - Provide the Data

Obtain the data tables from other packages or enter them directly.

``` r
# Basic numeric table
df_simple <- data.frame(
  A = c(1.234, 5.678),
  B = c(9.876, 3.210)
)
df_simple
```

    ##       A     B
    ## 1 1.234 9.876
    ## 2 5.678 3.210

``` r
# Mixed types with row names
df_mixed <- data.frame(
  Score = c(98.456, 77.8),
  Passed = c(TRUE, FALSE)
)
rownames(df_mixed) <- c("Alice", "Bob")
df_mixed
```

    ##        Score Passed
    ## Alice 98.456   TRUE
    ## Bob   77.800  FALSE

### Step 2 - Format the Table

After obtaining the table, use `format_table()` to customize digits,
width, and alignment.

``` r
# Default formatting
format_table(df_simple)
```

    ##      A    B
    ## 1 1.23 9.88
    ## 2 5.68 3.21

``` r
# Apply rounding to one digit
format_table(df_mixed, digits = 1)
```

    ##       Score Passed
    ## Alice  98.5   TRUE
    ## Bob    77.8  FALSE

``` r
# Different digits per column
df_digits <- data.frame(
  A = c(12.3456, 7.89123),
  B = c(0.000123, 5000.1),
  C = c(1000.1, 3.14159)
)
format_table(df_digits, digits = c(1, 4, 2))
```

    ##      A         B       C
    ## 1 12.3    0.0001 1000.10
    ## 2  7.9 5000.1000    3.14

``` r
# Custom width and alignment
df_align <- data.frame(
  City = c("New York", "LA"),
  Pop = c(8419600, 3980400),
  Growth = c(0.01, -0.005)
)
rownames(df_align) <- c("2023", "2024")
format_table(df_align,
             digits = c(0, 0, 3),
             width = c(12, 10, 10),
             align = c("left", "right", "center"))
```

    ##          City     Pop Growth
    ## 2023 New York 8419600  0.010
    ## 2024       LA 3980400 -0.005

``` r
# Truncated labels and centered alignment
df_trunc <- data.frame(
  Label = c("SuperLongLabel", "Short"),
  Value = c(3.14159, 2.71828)
)
format_table(df_trunc,
             digits = 2,
             width = c(12, 12),
             align = c("center", "right"))
```

    ##            Label Value
    ## 1 SuperLongLabel  3.14
    ## 2          Short  2.72

### Step 3 - Style the Table

After formatting, apply styling using `style_plain()`,
`style_markdown()`, or `style_apa()`. Spacing of the output vertically
can be specified.

``` r
# Create a data frame
df_stats <- data.frame(
  M = c(12.3456, 7.89123),
  SD = c(0.000123, 5000.1),
  N = c(1000, 315)
)
rownames(df_stats) <- c("Group 1", "Group 2")
```

``` r
# Plain styling
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_plain(caption = "Table 1: Summary", space = c(1, 1))
```

    ## 
    ## Table 1: Summary
    ## 
    ##                     M           SD           N
    ## Group 1          12.3       0.0001        1000
    ## Group 2           7.9    5000.1000         315
    ## 

``` r
# Markdown styling
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_markdown(caption = "### Table 1: Summary", space = c(1, 2))
```

    ## 
    ## ### Table 1: Summary
    ## 
    ## |           |          M |          SD |          N |
    ## | :-------- | ---------: | ----------: | ---------: |
    ## | Group 1   |       12.3 |      0.0001 |       1000 |
    ## | Group 2   |        7.9 |   5000.1000 |        315 |
    ## 
    ## 

``` r
# APA-style output
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_apa("Table 1\nDescriptive Statistics", space = 3)
```

    ## 
    ## 
    ## 
    ## Table 1
    ## Descriptive Statistics
    ## 
    ## -------------------------------------------
    ##                   M          SD          N 
    ## -------------------------------------------
    ##  Group 1       12.3      0.0001       1000 
    ##  Group 2        7.9   5000.1000        315 
    ## -------------------------------------------
    ## 
    ## 
    ## 

### Step 4 - Save the Output

If desired, the formatted and styled output can be exported to a file.
(You may find it helpful to \`getwd()’ first to find where you files
will be saved.)

``` r
# Save plain-styled table
df_stats |>
  format_table(digits = 2) |>
  style_plain(caption = "My Table") |>
  save_output(file = "my_table.txt")
```

``` r
# Save APA-styled table
df_stats |>
  format_table(digits = 2) |>
  style_apa(caption = "My Table") |>
  save_output(file = "my_apa_table.txt")
```

``` r
# Save markdown-styled table
df_stats |>
  format_table(digits = 2) |>
  style_markdown(caption = "My Table") |>
  save_output(file = "my_table.md")
```

### Addendum - Working with Other Data Types

`format_table()` works with a variety of R object types beyond data
frames. This permits the ability to perform the above actions for
results from a wide variety of packages.

``` r
# Numeric matrix
mat_num <- matrix(c(1.2345, 6.789, 0.00123, 456.7), nrow = 2)
format_table(mat_num, digits = 2)
```

    ##     V1     V2
    ## 1 1.23   0.00
    ## 2 6.79 456.70

``` r
# Character matrix
mat_char <- matrix(c("apple", "banana", "kiwi", "melon"), nrow = 2)
format_table(mat_char)
```

    ##       V1    V2
    ## 1  apple  kiwi
    ## 2 banana melon

``` r
# Named vector
vec_named <- c(a = 1.234, b = 5.678)
format_table(vec_named, digits = 1)
```

    ##     a   b
    ## 1 1.2 5.7

``` r
# Unnamed vector
vec_unnamed <- c(10.1, 20.2)
format_table(vec_unnamed)
```

    ##      V1    V2
    ## 1 10.10 20.20

``` r
# Lists (even with mixed input)
lst <- list(
  df = data.frame(a = 1:3, b = c(2.345, 3.456, 4.567)),
  named_vec = c(foo = 1.23, bar = 4.56),
  unnamed_vec = c(10, 20, 30),
  mat = matrix(1:6, ncol = 2)
)
format_table(lst, width=8, digits=3) |> style_plain()
```

    ## 
    ## df
    ## 
    ##               a           b
    ## 1         1.000       2.345
    ## 2         2.000       3.456
    ## 3         3.000       4.567
    ##  
    ## 
    ## named_vec
    ## 
    ##             foo         bar
    ## 1         1.230       4.560
    ##  
    ## 
    ## unnamed_vec
    ## 
    ##              V1          V2          V3
    ## 1        10.000      20.000      30.000
    ##  
    ## 
    ## mat
    ## 
    ##              V1          V2
    ## 1         1.000       4.000
    ## 2         2.000       5.000
    ## 3         3.000       6.000
    ## 
