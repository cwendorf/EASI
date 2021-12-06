# Estimation Approach to Statistical Inference
## Mean Difference (with By Option)

### Confidence Intervals

.estimateMeanDifferenceBy <- function(...) 
  UseMethod(".estimateMeanDifferenceBy")

.estimateMeanDifferenceBy.wss <- function(ListDescStats,ListCorrStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeanDifference.wss(ListDescStats[[i]],ListCorrStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateMeanDifferenceBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeanDifference.bss(ListDescStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.estimateMeanDifferenceBy.default <- function(...,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)
  results <- .estimateMeanDifferenceBy.wss(ListDescStats,ListCorrStats,conf.level=conf.level)
  return(results)
}

.estimateMeanDifferenceBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateMeanDifferenceBy.bss(ListDescStats,conf.level=conf.level)
  return(results)
}

estimateMeanDifferenceBy <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- .estimateMeanDifferenceBy(...,conf.level=conf.level)
  if(is.null(main)) {main <- "Confidence Interval for the Mean Difference"}
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeanDifferenceBy <- function(...) 
  UseMethod(".testMeanDifferenceBy")

.testMeanDifferenceBy.wss <- function(ListDescStats,ListCorrStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeanDifference.wss(ListDescStats[[i]],ListCorrStats[[i]],mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeanDifferenceBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeanDifference.bss(ListDescStats[[i]],mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeanDifferenceBy.default <- function(...,by,mu=0) {
  ListDescStats <- .describeMeansBy(...,by=by)
  ListCorrStats <- .describeCorrelationsBy(...,by=by)  
  results <- .testMeanDifferenceBy.wss(ListDescStats,ListCorrStats,mu=mu)
  return(results)
}

.testMeanDifferenceBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .testMeanDifferenceBy.bss(ListDescStats,mu=mu)
  return(results)
}

testMeanDifferenceBy <- function(...,mu=0,main=NULL,digits=3) {
  results <- .testMeanDifferenceBy(...,mu=mu)
  if(is.null(main)) {main <- "Hypothesis Test for the Mean Difference"} 
  main <-  paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Interval Plots

plotMeanDifferenceBy <- function(...,by,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pch=16,col="black") {
  results <- estimateMeanDifferenceBy(...,by=by,conf.level=conf.level)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  for (i in 1:nlevels(by)) {
    title <- names(results[i])
    temp <- .unformatFrame(results[[i]][,c(1,4,5)])
    .cipMain(results=temp,main=title,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE) 
}
