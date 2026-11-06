# [`EASI`](https://github.com/cwendorf/EASI)

## Plot Relational

### Description

Provides a plot of arelational (confidence) and relational (comparative) intervals for each group or level mean.

### Usage

```r
plotRelational.data.frame(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

plotRelational.formula(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

plotRelational.wsm(moments, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)

plotRelational.bsm(moments, add=FALSE, main=NULL, ylab="Outcome", xlab="", conf.level=.95, mu=NULL, rope=NULL, values=TRUE, ylim=NULL, digits=3, col=rgb(.5, .5, .5, .4), border=NA)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`ylab`**: a label for the y-axis
- **`xlab`**: a label for the x-axis
- **`mu`**: a number indicating the true/hypothesized value of the mean
- **`conf.level`**: confidence level of the interval
- **`line`**: a number for a horizontal reference line
- **`add`**: whether the plot should added to the existing plot
- **`values`**: whether the points should be labeled with their values
- **`main`**: a custom title for the graph
- **`ylim`**: custom limits for the y axis
- **`digits`**: the specified number of decimal places
- **`col`**: a value for the shaded color of the relational plot
- **`border`**: a value for the border color of the relational plot

### Value

- **`M`**: the means for the variables or groups
- **`CI.LL`**: the lower limits of the confidence intervals of the means
- **`CI.UL`**: the upper limits of the confidence intervals of the means
- **`RI.LL`**: the lower limits of the relational intervals for the means
- **`RI.UL`**: the upper limits of the relational intervals for the means
- **`mu`**: a horizontal line for the true/hypothesized value

### References

Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133.
