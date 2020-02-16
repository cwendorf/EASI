# Estimation Approach to Statistical Inference
## General Functions

### Formatting Functions

#### Formatting a Frame for Consistent Rounding

formatFrame <- function(results,digits=3) {
  return(format(as.data.frame(round(results,digits=digits)),width=7,trim=T,nsmall=digits))
}
