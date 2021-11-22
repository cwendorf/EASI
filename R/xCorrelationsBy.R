# Estimation Approach to Statistical Inference
## Correlations for Factorial and Mixed Designs

### Descriptives

.describeCorrelationsBy <- function(...) 
  UseMethod(".describeCorrelationsBy")

.describeCorrelationsBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,.describeCorrelations)
  return(results)
}

describeCorrelationsBy <- function(...,main=NULL,digits=3) {
  results <- .describeCorrelationsBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Correlation Matrix for the Variables"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
