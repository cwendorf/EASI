# Estimation Approach to Statistical Inference
## Functions for Median Comparisons

### Confidence Interval Functions

estimateMedianComparison <- function(x,...) 
  UseMethod("estimateMedianComparison")

estimateMedianComparison.default <- estimateMedianComparison.formula <- function(...,conf.level=.95,main=NULL,digits=3) {
  Levels <- estimateMedians(...,conf.level=conf.level,digits=digits)
  Levels[[1]] <- Levels[[1]][1:2,]
  Diff <- estimateMedianDifference(...,conf.level=conf.level,digits=digits)
  results <- c(Levels,Diff)
  return(results)
} 

### Confidence Interval Plot Functions

plotMedianComparison <- function(x,...) 
  UseMethod("plotMedianComparison")

plotMedianComparison.default <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMedianComparison(...,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Median Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Median Difference")
}

plotMedianComparison.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMedianComparison(formula,conf.level=conf.level,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Median Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Median Difference")
}
