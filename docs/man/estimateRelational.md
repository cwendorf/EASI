# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Relational

### Description

Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.

### Usage

```r
estimateRelational.data.frame(frame, conf.level=.95, ...)

estimateRelational.formula(formula, conf.level=.95, ...)

estimateRelational.wsm(moments, conf.level=.95, ...)

estimateRelational.bsm(moments, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a matrix/frame of descriptive/summary statistics
- **`conf.level`**: confidence level of the interval

### Value

- **`M`**: the means for the variables or groups
- **`CI.LL`**: the lower limits of the confidence intervals of the means
- **`CI.UL`**: the upper limits of the confidence intervals of the means
- **`RI.LL`**: the lower limits of the relational intervals for the means
- **`RI.UL`**: the upper limits of the relational intervals for the means

### References

Wendorf, C. A. (2012). Drawing inferences from multiple intervals in the single-factor design: Derivations, clarifications, extensions, and representations. Methodology European Journal of Research Methods for the Behavioral and Social Sciences, 8, 125-133.
