# [`EASI`](https://github.com/cwendorf/EASI)

## Contruct

### Description

Construct a frame from vectors of data, summary statistics, or correlations.

### Usage

```r
construct.default(..., class="data")
```

### Arguments

- **`...`**: a set of vectors to combine into a frame
- **`class`**: specified class of the frame

### Value

The returned frame contains a column for each variable (data), a row for each variable (bsm and wsm), and both columns and rows for each variable (cor).
