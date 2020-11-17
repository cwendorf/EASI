# Estimation Approach to Statistical Inference
## Functions for Standardized Mean Comparisons

### Confidence Interval Functions

estimateStandardizedMeansComparison <- estimateStandardizedMeanComparison <- function(x,...) 
  UseMethod("estimateStandardizedMeanComparison")

estimateStandardizedMeanComparison.default <- estimateStandardizedMeanComparison.formula <- estimateStandardizedMeanComparison.wss <- estimateStandardizedMeanComparison.bss <- function(...,conf.level=.95,mu=0,main=NULL,digits=3) {
  Levels <- estimateStandardizedMeans(...,conf.level=conf.level,mu=mu,digits=digits)
  Levels[[1]] <- Levels[[1]][1:2,]
  Diff <- estimateStandardizedMeanDifference(...,conf.level=conf.level,digits=digits)
  results <- c(Levels,Diff)
  return(results)
} 

### Confidence Interval Plot Functions

plotStandardizedMeansComparison <- plotStandardizedMeanComparison <- function(x,...) 
  UseMethod("plotStandardizedMeanComparison")

plotStandardizedMeanComparison.wss <- function(CompStats,CorrStats,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanComparison(CompStats,CorrStats,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch)
}

plotStandardizedMeanComparison.bss <- function(CompStats,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanComparison(CompStats,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch)
}

plotStandardizedMeanComparison.default <- function(...,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanComparison(...,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch)
}

plotStandardizedMeanComparison.formula <- function(formula,main=NULL,ylab="Standardized Mean Difference",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,pch=c(24,24,24)) {
  results <- estimateStandardizedMeanComparison(formula,conf.level=conf.level,mu=mu,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Standardized Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch)
}
