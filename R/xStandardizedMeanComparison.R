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
  rn <- names(results)
  results <- .formatList(results,digits=digits)
  names(results) <- rn
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanComparison <- function(x,...) 
  UseMethod("plotStandardizedMeanComparison")

plotStandardizedMeanComparison.wss <- function(CompStats,CorrStats,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanComparison(CompStats,CorrStats,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanComparison.bss <- function(CompStats,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanComparison(CompStats,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

plotStandardizedMeanComparison.default <- function(...,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanComparison(...,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotStandardizedMeanComparison.formula <- function(formula,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24),col="black") {
  results <- estimateStandardizedMeanComparison(formula,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}
