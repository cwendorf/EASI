# Estimation Approach to Statistical Inference
## Standardized Means (with By Option)

### Confidence Intervals

.estimateStandardizedMeansBy <- function(...) 
  UseMethod(".estimateStandardizedMeansBy")

.estimateStandardizedMeansBy.wss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeans.wss(ListDescStats[[i]],conf.level=conf.level,mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansBy.bss <- function(ListDescStats,conf.level=.95,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateStandardizedMeans.bss(ListDescStats[[i]],conf.level=conf.level,mu=mu)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansBy.default <- function(...,by,mu=0,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  results <- .estimateStandardizedMeansBy.wss(ListDescStats,mu=mu,conf.level=conf.level)
  return(results)
}

.estimateStandardizedMeansBy.formula <- function(formula,by,mu=0,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateStandardizedMeansBy.bss(ListDescStats,mu=mu,conf.level=conf.level)
  return(results)
}

estimateStandardizedMeansBy <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeansBy(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Confidence Intervals for the Standardized Means"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
