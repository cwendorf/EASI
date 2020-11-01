# Estimation Approach to Statistical Inference
## Functions for Correlation Difference

### Confidence Interval Functions

estimateCorrelationsDifference <- estimateCorrelationDifference <- function(x,...) 
  UseMethod("estimateCorrelationDifference")

estimateCorrelationDifference <- function(CorrEst1,CorrEst2,main=NULL,digits=3) {
  corr1 <- .unformatFrame(CorrEst1[[1]])[1,1]
  LL1 <- .unformatFrame(CorrEst1[[1]])[1,3]
  UL1 <- .unformatFrame(CorrEst1[[1]])[1,4]
  corr2 <- .unformatFrame(CorrEst2[[1]])[1,1]
  LL2 <- .unformatFrame(CorrEst2[[1]])[1,3]
  UL2 <- .unformatFrame(CorrEst2[[1]])[1,4]
  Diff <- corr2-corr1
  LL <- corr2-corr1-sqrt((corr1-LL1)^2+(UL2-corr2)^2)
  UL <- corr2-corr1+sqrt((UL1-corr1)^2+(corr2-LL2)^2)
  results <- data.frame(Diff=Diff,LL=LL,UL=UL)
  rownames(results)="Difference"
  if(is.null(main)) {main="Confidence Interval for the Correlation Difference"}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)  
}

### Confidence Interval Plot Functions

plotCorrelationsDifference <- plotCorrelationDifference <- function(x,...) 
  UseMethod("plotCorrelationDifference")

plotCorrelationDifference <- function(CorrEst1,CorrEst2,main=NULL,ylab="Correlation",xlab="",values=TRUE,ylim=NULL,digits=3,pch=NULL,...) {
  results <- .unformatFrame(estimateCorrelationDifference(CorrEst1,CorrEst2)[[1]][,c(1,2,3)])
  if(is.null(main)) {main="Confidence Interval for the Correlation Difference"}
  .cipMain(results,main,ylab=ylab,xlab=xlab,mu=NULL,rope=NULL,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=17)
}
