# Estimation Approach to Statistical Inference
## Standardized Regression Coefficients

### Confidence Intervals

.estimateStandardizedRegressionCoefficients <- function(x,...) 
  UseMethod(".estimateStandardizedRegressionCoefficients")

.estimateStandardizedRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95) {
  temptab <- .estimateRegressionCoefficients.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
  temptab <- rbind(temptab[-1,])
  rownames(temptab) <- rownames(PredStats)
  std <- PredStats[,"SD"]/CritStats[,"SD"]
  results <- rbind(temptab*std)
  return(results)
}

.estimateStandardizedRegressionCoefficients.default <- function(Predictors,Criterion,conf.level=.95) {
  Pred <- cbind(Predictors)
  if(is.null(ncol(Predictors))) {colnames(Pred) <- deparse(substitute(Predictors))}
  PredStats <- .describeMeans(Pred)
  CritStats <- .describeMeans(Criterion)
  CorrStats <- .describeCorrelations(Pred,Criterion)
  .estimateStandardizedRegressionCoefficients.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
}

estimateStandardizedRegressionCoefficients <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedRegressionCoefficients(...)
  if(is.null(main)) {main <- "Confidence Intervals for the Standardized Regression Coefficients"}  
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Interval Plots

plotStandardizedRegressionCoefficients <- function(...,main=NULL,digits=3,ylab="Standardized Regression Coefficient",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,pch=22,col="black") {
  results <- estimateStandardizedRegressionCoefficients(...,conf.level=conf.level,main=main,digits=digits)
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,3,4)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add,pch=pch,col=col)
}
