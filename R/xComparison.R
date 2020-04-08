# Estimation Approach to Statistical Inference
## Functions for Means and Mean Differences

### Confidence Interval Functions

#### CI Function for Mean Comparisons

estimateComparison <- function(...,conf.level=.95,main=NULL,digits=3) {
  Levels <- estimateMeans(...,conf.level=conf.level,digits=digits)
  Levels[[1]] <- Levels[[1]][1:2,]
  Diff <- estimateDifference(...,conf.level=conf.level,digits=digits)
  results <- c(Levels,Diff)
  return(results)
} 

### Plot Functions

#### Plot Function for Confidence Intervals of Mean Comparisons

plotComparison <- function(...) 
  UseMethod("plotComparison")

plotComparison.wss <- function(CompStats,CorrStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateComparison(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(data.matrix(results[[1]][,c(1,4,5)]),data.matrix(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotComparison.bss <- function(CompStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateComparison(CompStats,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(data.matrix(results[[1]][,c(1,4,5)]),data.matrix(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=FALSE)
}

plotComparison.default <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateComparison(...,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(data.matrix(results[[1]][,c(1,4,5)]),data.matrix(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotComparison.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  results <- estimateComparison(formula,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(data.matrix(results[[1]][,c(1,4,5)]),data.matrix(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits,connect=FALSE)
}
