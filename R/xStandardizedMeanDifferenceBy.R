# Estimation Approach to Statistical Inference
## Standardized Mean Difference (with By Option)

### Confidence Intervals

.estimateStandardizedMeanDifferenceBy <- function(...) 
  UseMethod(".estimateStandardizedMeanDifferenceBy")

.estimateStandardizedMeanDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeanDifference.wss(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeanDifferenceBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeanDifference.bss(ListDescStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeanDifferenceBy.default <- function(...,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)
  results <- .estimateStandardizedMeanDifferenceBy.wss(ListDescStats,ListCorrStats,conf.level=conf.level)
  return(results)
}

.estimateStandardizedMeanDifferenceBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateStandardizedMeanDifferenceBy.bss(ListDescStats,conf.level=conf.level)
  return(results)
}

estimateStandardizedMeanDifferenceBy <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeanDifferenceBy(...)
  if(is.null(main)) {main <- "Confidence Interval for the Standardized Mean Difference"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
