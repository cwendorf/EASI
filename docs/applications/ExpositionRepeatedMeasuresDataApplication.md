
## Exposition Repeated Measures Data Application

This page explains the use of the exposition operator in analyzing
defined data frames using repeated-measures (within-subjects) data.

- [Data Management](#data-management)
- [Using the Exposition Operator](#using-the-exposition-operator)

------------------------------------------------------------------------

### Data Management

Simulate some data, placing it directly into a data frame (as opposed to
declaring the variables separately).

``` r
RepeatedData <- data.frame(Outcome1=round(rnorm(50,mean=7,sd=2),0),
                          Outcome2=round(rnorm(50,mean=11,sd=4),0),
                          Outcome3=round(rnorm(50,mean=12,sd=4),0))
```

### Using the Exposition Operator

When larger or predefined data sets are used, it is necessary to
identify the data first and then select the variables from within the
data set. In base R, this is accomplished using a `with` command (or
built in data identification parameters). Note that this does not easily
permit the use of pipe operators to work with the individual variables.

``` r
with(RepeatedData,estimateMeans(RepeatedData))
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   7.180   0.315  49.000   6.547   7.813
    ## Outcome2  10.920   0.468  49.000   9.979  11.861
    ## Outcome3  12.400   0.580  49.000  11.235  13.565

In EASI, this is accomplished more efficiently and flexibly by using an
exposition operator (such as the included `%$>%`). This is particularly
useful in cases where there is a desire to on specific variables.

``` r
RepeatedData %$>% cbind(Outcome1,Outcome2) |> estimateMeans()
```

    ## $`Confidence Intervals for the Means`
    ##                M      SE      df      LL      UL
    ## Outcome1   7.180   0.315  49.000   6.547   7.813
    ## Outcome2  10.920   0.468  49.000   9.979  11.861

``` r
RepeatedData %$>% cbind(Outcome1,Outcome2) |> plotMeans()
```

![](figures/Exposition-Repeated-Basic-1.png)<!-- -->
