# Estimation Approach to Statistical Inference
## Means (with By Option)

#### Descriptives

.describeMeansBy <- function(...) 
  UseMethod(".describeMeansBy")

.describeMeansBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,.describeMeans)
  return(results)
}

.describeMeansBy.formula <- function(formula,by) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  FactorialData <- data.frame(by,Group,Outcome)
  SplitData <- split(FactorialData,by)
  results <- lapply(SplitData,function(x) with(x,.describeMeans(Outcome~Group)))
  return(results)
}

describeMeansBy <- function(...,main=NULL,digits=3) {
  results <- .describeMeansBy(...)
  if(is.null(main)) {main <- "Descriptive Statistics for the Data"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main,digits=digits)
  return(results)
}

### Confidence Intervals

.estimateMeansBy <- function(...) 
  UseMethod(".estimateMeansBy")

.estimateMeansBy.wss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeans.wss(ListDescStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- "wss"
  return(results)
}

.estimateMeansBy.bss <- function(ListDescStats,conf.level=.95) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeans.wss(ListDescStats[[i]],conf.level=conf.level)}
  names(results) <- names(ListDescStats)  
  class(results) <- "bss"
  return(results)
}

.estimateMeansBy.default <- function(...,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(...,by=by)
  results <- .estimateMeansBy.wss(ListDescStats,conf.level=conf.level)
  return(results)
}

.estimateMeansBy.formula <- function(formula,by,conf.level=.95) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .estimateMeansBy.bss(ListDescStats,conf.level=conf.level)
  return(results)
}

estimateMeansBy <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansBy(...)
  if(is.null(main)) {main <- "Confidence Intervals for the Means"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Tests 

.testMeansBy <- function(...) 
  UseMethod(".testMeansBy")

.testMeansBy.wss <- .testMeansBy.bss <- function(ListDescStats,mu=0) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeans.wss(ListDescStats[[i]],mu=mu)}
  names(results) <- names(ListDescStats)  
  class(results) <- NULL
  return(results)
}

.testMeansBy.default <- function(...,by,mu=0) {
  ListDescStats <- .describeMeansBy(...,by=by)
  results <- .testMeansBy.wss(ListDescStats,mu=mu)
  return(results)
}

.testMeansBy.formula <- function(formula,by,mu=0) {
  ListDescStats <- .describeMeansBy(formula,by=by)
  results <- .testMeansBy.bss(ListDescStats,mu=mu)
  return(results)
}

testMeansBy <- function(...,main=NULL,digits=3) {
  results <- .testMeansBy(...)
  if(is.null(main)) {main <- "Hypothesis Tests for the Means"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}

### Confidence Interval Plots

plotMeansBy <- function(...,by,main=NULL,ylab="Outcome",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,digits=3,pos=2,connect=FALSE,pch=16,col="black") {
  results <- estimateMeansBy(...,by=by,conf.level=conf.level)
  if(typeof(...)=="list" | typeof(...)=="double" ) {connect=TRUE}
  for (i in 1:nlevels(by)) {
    temp <- results[i]
    plotIntervals(temp,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col)
    par(ask=TRUE)
  }
  par(ask=FALSE) 
}
