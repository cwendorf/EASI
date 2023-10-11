# Estimation Approach to Statistical Inference
## Eta Squared (with By Option)

### Descriptives

.describeMeansEffectBy <- function(x,...)
  UseMethod(".describeMeansEffectBy")

.describeMeansEffectBy.wss <- function(ListDescStats,ListCorrStats,...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansEffect.wss(ListDescStats[[i]],ListCorrStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansEffectBy.bss <- function(ListDescStats,...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansEffect.bss(ListDescStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansEffectBy.default <- function(frame,by,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy(data,by=by)
  ListCorrStats <- .describeCorrelationsBy(data,by=by)  
  results <- .describeMeansEffectBy.wss(ListDescStats,ListCorrStats)
  return(results)
}

.describeMeansEffectBy.formula <- function(formula,by,...) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .describeMeansEffectBy.bss(ListDescStats)
  return(results)
}

describeMeansEffectBy <- function(...,main=NULL,digits=3) {
  results <- .describeMeansEffectBy(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"}
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Intervals

.estimateMeansEffectBy <- function(x,...)
  UseMethod(".estimateMeansEffectBy")

.estimateMeansEffectBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.90,...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeansEffect.wss(ListDescStats[[i]],ListCorrStats[[i]],conf.level)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansEffectBy.bss <- function(ListDescStats,conf.level=.90,...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeansEffect.bss(ListDescStats[[i]],conf.level)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansEffectBy.default <- function(frame,by,conf.level=.90,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy(data,by=by)
  ListCorrStats <- .describeCorrelationsBy(data,by=by)  
  results <- .estimateMeansEffectBy.wss(ListDescStats,ListCorrStats,conf.level)
  return(results)
}

.estimateMeansEffectBy.formula <- function(formula,by,conf.level=.90,...) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateMeansEffectBy.bss(ListDescStats,conf.level)
  return(results)
}

estimateMeansEffectBy <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansEffectBy(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"}
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
