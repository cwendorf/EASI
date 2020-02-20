## `describeData` {EASI}

# Describe Data

### Description

Provides a table of descriptive/summary statistics for a data set.

### Usage

```r
# describeData is a wrapper function. It will automatically call the appropriate method below given the class of the object.
describeData(list(),digits=3)
list(list("descData"), list("default"))(list())
list(list("descData"), list("formula"))(formula)
```

### Arguments

Argument      |Description
------------- |----------------
```list()```     |     a set of (non-empty) numeric vectors of data values.
```formula```     |     a formula of the form `lhs ~ rhs` where `lhs` is a numeric variable giving the data values and `rhs` a factor giving the corresponding groups.
```digits```     |     the specified number of decimal places.

### Details

Tutorials and examples from published work are available at [https://cwendorf.github.io/EASI/](https://cwendorf.github.io/EASI/) 


