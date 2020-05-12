# Estimation Approach to Statistical Inference
## Basic Functions for Formatting

### Formatting Functions

.formatFrame <- function(results,digits=3) {
  return(format(as.data.frame(round(results,digits=digits)),width=7,trim=T,nsmall=digits))
}

.formatList <- function(results,digits=3) {
  return(lapply(results,.formatFrame,digits))
}
