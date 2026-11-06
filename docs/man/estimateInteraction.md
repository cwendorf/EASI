# [`EASI`](https://github.com/cwendorf/EASI)

## Estimate Interaction

### Description

Provides the confidence intervals for the simple effects and the interaction contrast in a 2x2 design.

### Usage

```r
estimateInteraction.data.frame(frame, by, conf.level=.95, ...)

estimateInteraction.formula(formula, by, conf.level=.95, ...)

estimateInteraction.bsm(moments, conf.level=.95, ...)

estimateInteraction.wsm(moments, corrs, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a list of matrices/frames of descriptive/summary statistics
- **`corrs`**: a list of matrices/frames of correlations
- **`by`**: a factor used for blocking
- **`conf.level`**: confidence level of the interval

### Value

- **`Est`**: the contrasts for the simple effects and the interaction
- **`SE`**: the standard errors for the simple effects and the interaction
- **`df`**: the degrees of freedom for the simple effects and the interaction
- **`LL`**: the lower limit of the confidence intervals for the simple effects and the interaction
- **`UL`**: the upper limit of the confidence intervals for the simple effects and the interaction
