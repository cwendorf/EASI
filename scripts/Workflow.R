# tableR
## Initial Examples

source("http://raw.githubusercontent.com/cwendorf/tableR/main/source-tableR.R")

### Step 1: Provide the Data

# Basic numeric table
df_simple <- data.frame(
  A = c(1.234, 5.678),
  B = c(9.876, 3.210)
)
df_simple

# Mixed types with row names
df_mixed <- data.frame(
  Score = c(98.456, 77.8),
  Passed = c(TRUE, FALSE)
)
rownames(df_mixed) <- c("Alice", "Bob")
df_mixed

### Step 2: Format the Table

# Default formatting
format_table(df_simple)

# Apply rounding to one digit
format_table(df_mixed, digits = 1)

# Different digits per column
df_digits <- data.frame(
  A = c(12.3456, 7.89123),
  B = c(0.000123, 5000.1),
  C = c(1000.1, 3.14159)
)
format_table(df_digits, digits = c(1, 4, 2))

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

# Truncated labels and centered alignment
df_trunc <- data.frame(
  Label = c("SuperLongLabel", "Short"),
  Value = c(3.14159, 2.71828)
)
format_table(df_trunc,
             digits = 2,
             width = c(12, 12),
             align = c("center", "right"))

### Step 3: Style the Table

# Create a data frame
df_stats <- data.frame(
  M = c(12.3456, 7.89123),
  SD = c(0.000123, 5000.1),
  N = c(1000, 315)
)
rownames(df_stats) <- c("Group 1", "Group 2")

# Plain styling
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_plain(caption = "Table 1: Summary", space = c(1, 1))

# Markdown styling
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_markdown(caption = "### Table 1: Summary", space = c(1, 2))

# APA-style output
df_stats |>
  format_table(digits = c(1, 4, 0)) |>
  style_apa("Table 1\nDescriptive Statistics", space = 3)

### Step 4: Save the Output

# Save plain-styled table
df_stats |>
  format_table(digits = 2) |>
  style_plain(caption = "My Table") |>
  save_output(file = "my_table.txt")

# Save APA-styled table
df_stats |>
  format_table(digits = 2) |>
  style_apa(caption = "My Table") |>
  save_output(file = "my_apa_table.txt")

# Save markdown-styled table
df_stats |>
  format_table(digits = 2) |>
  style_markdown(caption = "My Table") |>
  save_output(file = "my_table.md")

### Addendum: Working with Other Data Types

# Numeric matrix
mat_num <- matrix(c(1.2345, 6.789, 0.00123, 456.7), nrow = 2)
format_table(mat_num, digits = 2)

# Character matrix
mat_char <- matrix(c("apple", "banana", "kiwi", "melon"), nrow = 2)
format_table(mat_char)

# Named vector
vec_named <- c(a = 1.234, b = 5.678)
format_table(vec_named, digits = 1)

# Unnamed vector
vec_unnamed <- c(10.1, 20.2)
format_table(vec_unnamed)

# Lists (even with mixed input)
lst <- list(
  df = data.frame(a = 1:3, b = c(2.345, 3.456, 4.567)),
  named_vec = c(foo = 1.23, bar = 4.56),
  unnamed_vec = c(10, 20, 30),
  mat = matrix(1:6, ncol = 2)
)
format_table(lst, width=8, digits=3) |> style_plain()
