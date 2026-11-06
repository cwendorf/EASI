# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Boxes

### Description

Provides a boxplot for each group or variable.

### Usage

```r
plotBoxes.default(variable, ...)

plotBoxes.data.frame(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=0, scale=.8, border="black", col=rgb(0, 0, 0, 0), values=TRUE)

plotBoxes.formula(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=0, scale=.8, border="black", col=rgb(0, 0, 0, 0), values=TRUE)
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
- **`offset`**: a value indicating the offset of the boxplot
- **`scale`**: a value that indicates the width of the boxplot
- **`col`**: a value for the shaded color of the boxplot
- **`border`**: a value for the border color of the boxplot
- **`values`**: whether the values should be added to the boxplot
- **`digits`**: the specified number of decimal places

### Value

- **`LW`**: the lower whisker
- **`LH`**: the lower hinge
- **`Mdn`**: the median value
- **`UH`**: the upper hinge
- **`UW`**: the upper whisker

### Details

`plotBoxes` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addBoxes` is identical to `plotBoxes` without the need to utilize the `add` argument.
