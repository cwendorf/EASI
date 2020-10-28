# Estimation Approach to Statistical Inference
## Functions for Mean Comparisons

### Confidence Interval Functions

estimateMeansComparison <- estimateMeanComparison <- function(x,...) 
  UseMethod("estimateMeanComparison")

estimateMeanComparison.default <- estimateMeanComparison.formula <- estimateMeanComparison.wss <- estimateMeanComparison.bss <- function(...,conf.level=.95,main=NULL,digits=3) {
  Levels <- estimateMeans(...,conf.level=conf.level,digits=digits)
  Levels[[1]] <- Levels[[1]][1:2,]
  Diff <- estimateMeanDifference(...,conf.level=conf.level,digits=digits)
  results <- c(Levels,Diff)
  return(results)
} 

### Confidence Interval Plot Functions

plotMeansComparison <- plotMeanComparison <- function(x,...) 
  UseMethod("plotMeanComparison")

plotMeanComparison.wss <- function(CompStats,CorrStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComparison(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE)
}

plotMeanComparison.bss <- function(CompStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComparison(CompStats,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}

plotMeanComparison.default <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComparison(...,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE)
}

plotMeanComparison.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanComparison(formula,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Mean Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}
