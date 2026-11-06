# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Frequencies

### Description

Provides a frequency distribution for each group or variable.

### Usage

```r
plotFrequencies.default(variable, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")

plotFrequencies.data.frame(frame, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")

plotFrequencies.formula(formula, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")
```

### Arguments

- **`variable`**: a numeric vector of data values
- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`add`**: whether the plot should added to the existing plot
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`type`**: side on which the distribution should be displayed
- **`offset`**: a value indicating the offset of the plot
- **`col`**: a value for the shaded color of the plot

### Value

The returned plot contains frequency distributions for the groups or variables.

### Details

`plotFrequencies` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addFrequencies` is identical to `plotFrequencies` without the need to utilize the `add` argument.
