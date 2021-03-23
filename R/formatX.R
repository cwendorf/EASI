# Estimation Approach to Statistical Inference
## Basic Functions for Formatting

### Formatting Functions

.formatFrame <- function(results,digits=3) {
  return(format(as.data.frame(round(results,digits=digits)),width=7,trim=T,nsmall=digits))
}

.formatList <- function(results,digits=3) {
  return(lapply(results,.formatFrame,digits))
}

.unformatFrame <- function(results) {
  return(apply(results,c(1,2),FUN=as.numeric))
}

.unformatList <- function(results) {
  return(lapply(results,.unformatFrame))
}

simplify <- function(results) {
  if(length(results)==1) {.unformatFrame(results[[1]])}
  else {.unformatList(results)}
}

