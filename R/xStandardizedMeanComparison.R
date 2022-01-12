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

### Confidence Interval Plots

plotStandardizedMeanComparison <- function(...,add=FALSE,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,pos=c(2,2,4),connect=FALSE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanComparison(...,conf.level=conf.level,main=main,digits=digits)
  if(typeof(...)=="list") {connect=TRUE}  
  if(is.null(main)) {main="Confidence Intervals for the Standardized Mean Comparison"}
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,rope=rope,digits=digits,connect=connect,pos=pos,col=col)
}
