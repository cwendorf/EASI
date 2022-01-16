# Estimation Approach to Statistical Inference
## Standardized Regression Coefficients

### Confidence Intervals

.estimateStandardizedRegressionCoefficients <- function(x,...) 
  UseMethod(".estimateStandardizedRegressionCoefficients")

.estimateStandardizedRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95,...) {
  temptab <- .estimateRegressionCoefficients.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
  temptab <- rbind(temptab[-1,])
  rownames(temptab) <- rownames(PredStats)
  std <- PredStats[,"SD"]/CritStats[,"SD"]
  results <- rbind(temptab*std)
  return(results)
}

.estimateStandardizedRegressionCoefficients.default <- function(Predictors,Criterion,conf.level=.95,...) {
  Pred <- data.frame(Predictors)
  if(ncol(Pred)==1) {colnames(Pred) <- deparse(substitute(Predictors))}  
  Crit <- data.frame(Criterion)
  PredStats <- .describeMeans.default(Pred)
  rownames(PredStats) <- colnames(Pred)
  CritStats <- .describeMeans.default(Crit)
  rownames(CritStats) <- colnames(Crit)
  CorrStats <- .describeCorrelations(cbind(Pred,Crit))
  .estimateStandardizedRegressionCoefficients.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
}

estimateStandardizedRegressionCoefficients <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedRegressionCoefficients(...)
  if(is.null(main)) {main <- "Confidence Intervals for the Standardized Regression Coefficients"}  
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Interval Plots

plotStandardizedRegressionCoefficients <- function(...,main=NULL,digits=3,ylab="Standardized Regression Coefficient",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,pos=2,connect=FALSE,ylim=NULL,add=FALSE,pch=22,col="black") {
  results <- estimateStandardizedRegressionCoefficients(...,conf.level=conf.level,main=main,digits=digits)
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col)
}
