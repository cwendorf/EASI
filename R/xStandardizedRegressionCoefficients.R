# Estimation Approach to Statistical Inference
## Standardized Regression Coefficients

### Confidence Intervals

estimateStandardizedRegressionCoefficients <- function(x,...) 
  UseMethod("estimateStandardizedRegressionCoefficients")

estimateStandardizedRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3) {
  temptab <- .unformatFrame(estimateRegressionCoefficients(PredStats,CritStats,CorrStats,conf.level=conf.level)[[1]])
  temptab <- rbind(temptab[-1,])
  rownames(temptab) <- rownames(PredStats)
  std <- PredStats[,"SD"]/CritStats[,"SD"]
  results <- rbind(temptab*std)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Standardized Regression Coefficients"} else {names(results) <- main}  
  return(results)
}

estimateStandardizedRegressionCoefficients.default <- function(Predictors,Criterion,conf.level=.95,main=NULL,digits=3) {
  Pred <- cbind(Predictors)
  if(is.null(ncol(Predictors))) {colnames(Pred) <- deparse(substitute(Predictors))}
  PredStats <- .unformatFrame(describeMeans(Pred)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Pred,Criterion)[[1]])
  class(CorrStats) <- "wss"
  estimateStandardizedRegressionCoefficients(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

### Confidence Interval Plots

plotStandardizedRegressionCoefficients <- function(x,...) 
  UseMethod("plotStandardizedRegressionCoefficients")

plotStandardizedRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,main=NULL,ylab="Standardized Coefficient",xlab="",mu=NULL,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=22,col="black") {
  results <- .unformatFrame(estimateStandardizedRegressionCoefficients(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Regression Coefficients"} else {main="Confidence Interval for the \n Standardized Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

plotStandardizedRegressionCoefficients.default <- function(Predictors,Criterion,main=NULL,ylab="Standardized Coefficient",xlab="",mu=NULL,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=22,col="black") {
  Pred <- cbind(Predictors)
  if(is.null(ncol(Predictors))) {colnames(Pred) <- deparse(substitute(Predictors))}
  results <- .unformatFrame(estimateStandardizedRegressionCoefficients(Pred,Criterion,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Regression Coefficients"} else {main="Confidence Interval for the \n Standardized Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}
