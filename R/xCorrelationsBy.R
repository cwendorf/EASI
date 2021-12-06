# Estimation Approach to Statistical Inference
## Correlations (with By Option)

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
  if(is.null(main)) {main <- "Correlation Matrix for the Variables"} 
  main <-  paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
