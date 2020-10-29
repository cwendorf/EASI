# Estimation Approach to Statistical Inference
## Functions for Correlation Comparison

### Confidence Interval Functions

estimateCorrelationsComparison <- estimateCorrelationComparison <- function(x,...) 
  UseMethod("estimateCorrelationComparison")

estimateCorrelationComparison.default <- function(CorrEst1,CorrEst2,main=NULL,digits=3) {
  Diff <- estimateCorrelationDifference(CorrEst1,CorrEst2)
  results <- c(CorrEst1,CorrEst2,Diff)
  return(results)
}  

### Confidence Interval Plot Functions

plotCorrelationsComparison <- plotCorrelationComparison <- function(x,...) 
  UseMethod("plotCorrelationComparison")

plotCorrelationComparison <- function(CorrEst1,CorrEst2,main=NULL,ylab="Outcome",xlab="",rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateCorrelationComparison(CorrEst1,CorrEst2,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,3,4)]),.unformatFrame(results[[3]][,c(1,2,3)]))
  if(is.null(main)) {main="Confidence Intervals for the Correlation Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE)
}
