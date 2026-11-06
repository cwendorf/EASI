# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Interaction

### Description

Provides a plot of the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.

### Usage

```r
plotInteraction.data.frame(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotInteraction.formula(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

plotInteraction.bsm(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`by`**: a factor used for blocking
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`mu`**: a number indicating the true/hypothesized value of the mean difference
- **`conf.level`**: confidence level of the interval
- **`rope`**: lower and upper values for a region of practical equivalence
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places

### Value

- **`Est`**: the contasts for the simple effects
- **`LL`**: the lower limit of the confidence intervals for the simple effects
- **`UL`**: the upper limit of the confidence intervals for the simple effects
- **`Est`**: the interaction contrast
- **`LL`**: the lower limit of the confidence interval for the interaction contrast
- **`UL`**: the upper limit of the confidence interval for the interaction contrast
- **`mu`**: a horizontal line for the true/hypothesized value
- **`rope`**: a shaded region of practical equivalence
