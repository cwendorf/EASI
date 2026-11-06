# [`EASI`](https://github.com/cwendorf/EASI)

## Test Interaction

### Description

Provides the statistical significance tests for the simple effects and the interaction contrast in a 2x2 design.

### Usage

```r
testInteraction.data.frame(frame, ...)

testInteraction.formula(formula, ...)

testInteraction.bsm(moments, ...)

testInteraction.wsm(moments, corrs, conf.level=.95, ...)
```

### Arguments

- **`frame`**: a set of (non-empty) numeric vectors of data values
- **`formula`**: a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups
- **`moments`**: a list of matrices/frames of descriptive/summary statistics
- **`corrs`**: a list of matrices/frames of correlations
- **`by`**: a factor used for blocking

### Value

- **`Est`**: the contrast for the simple effects and the interaction
- **`SE`**: the standard errors for the simple effects and the interaction
- **`df`**: the degrees of freedom for the simple effects and the interaction
- **`t`**: the t value for the simple effects and the interaction
- **`p`**: the p value for the simple effects and the interaction
