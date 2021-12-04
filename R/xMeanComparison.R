# Estimation Approach to Statistical Inference
## Mean Comparisons

### Confidence Intervals

.estimateMeanComparison <- function(x,...) 
  UseMethod(".estimateMeanComparison")

.estimateMeanComparison.default <- .estimateMeanComparison.formula <- .estimateMeanComparison.wss <- .estimateMeanComparison.bss <- function(...,conf.level=.95,mu=0) {
  Levels <- .estimateMeans(...,conf.level=conf.level,mu=0)
  Levels <- Levels[1:2,]
  Levels <- list(Levels)
  names(Levels) <- "Confidence Intervals for the Means"
  Diff <- .estimateMeanDifference(...,conf.level=conf.level,mu=0)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Mean Difference"
  results <- c(Levels,Diff)
  return(results)
} 

estimateMeanComparison <- function(...,main=NULL,digits=3) {
  results <- .estimateMeanComparison(...)
  rn <- names(results)
  results <- .formatList(results,digits=digits)
  names(results) <- rn
  return(results)
}


### Null Hypothesis Signifiance Tests

.testMeanComparison <- function(x,...) 
  UseMethod(".testMeanComparison")

.testMeanComparison.default <- .testMeanComparison.formula <- .testMeanComparison.wss <- .testMeanComparison.bss <- function(...) {
  Levels <- .testMeans(...)
  Levels <- Levels[1:2,]
  Levels <- list(Levels)
  names(Levels) <- "Hypothesis Tests for the Means"
  Diff <- .testMeanDifference(...)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Test for the Mean Difference"  
  results <- c(Levels,Diff)
  return(results)
} 

testMeanComparison <- function(...,main=NULL,digits=3) {
  results <- .testMeanComparison(...)
  rn <- names(results)
  results <- .formatList(results,digits=digits)
  names(results) <- rn
  return(results)
}

### Confidence Interval Plots

plotMeanComparison <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(16,16,17),col="black") {
  results <- estimateMeanComparison(...,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main="Confidence Intervals for the Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,slab="Mean Difference",pch=pch,col=col)
}
