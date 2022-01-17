# Estimation Approach to Statistical Inference
## Standardized Mean Comparisons

### Confidence Intervals

.estimateStandardizedMeanComparison <- function(x,...) 
  UseMethod(".estimateStandardizedMeanComparison")

.estimateStandardizedMeanComparison.default <- .estimateStandardizedMeanComparison.formula <- .estimateStandardizedMeanComparison.wss <- .estimateStandardizedMeanComparison.bss <- function(...,conf.level=.95,mu=0) {
  Levels <- .estimateStandardizedMeans(...,conf.level=conf.level,mu=mu)
  Levels <- Levels[1:2,]
  Levels <- list(Levels)
  names(Levels) <- "Confidence Intervals for the Standardized Means"
  Diff <- .estimateStandardizedMeanDifference(...,conf.level=conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Standardized Mean Difference"  
  results <- c(Levels,Diff)
  return(results)
} 

estimateStandardizedMeanComparison <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeanComparison(...)
  if(is.null(main)) {main <- names(results)} 
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
