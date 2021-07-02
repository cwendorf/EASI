# Estimation Approach to Statistical Inference
## Correlation Comparison

### Confidence Intervals

estimateCorrelationComparison <- function(x,...) 
  UseMethod("estimateCorrelationComparison")

estimateCorrelationComparison.default <- function(CorrEst1,CorrEst2,main=NULL,labels=NULL,digits=3) {
  Est1 <- .unformatFrame(CorrEst1[[1]])
  Est2 <- .unformatFrame(CorrEst2[[1]])
  results <- rbind(Est1,Est2)
  if(is.null(labels)) {rownames(results) <- c("Correlation 1","Correlation 2")} else {rownames(results) <- labels} 
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Correlations"     
  Diff <- estimateCorrelationDifference(CorrEst1,CorrEst2)
  results <- c(results,Diff)
  return(results)
}   

### Confidence Interval Plots

plotCorrelationComparison <- function(x,...) 
  UseMethod("plotCorrelationComparison")

plotCorrelationComparison.default <- function(CorrEst1,CorrEst2,main=NULL,ylab="Correlation",xlab="",rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3,col="black") {
  results <- estimateCorrelationComparison(CorrEst1,CorrEst2,main=main,labels=labels,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,3,4)]),.unformatFrame(results[[2]][,c(1,2,3)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Correlation Comparison"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Correlation Difference",col=col)
}
