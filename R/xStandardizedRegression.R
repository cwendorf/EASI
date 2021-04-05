# Estimation Approach to Statistical Inference
## Standardized Regression Coefficients

### Confidence Intervals

estimateStandardizedRegression <- function(x,...) 
  UseMethod("estimateStandardizedRegression")

estimateStandardizedRegression.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3) {
  temptab <- .unformatFrame(estimateRegression(PredStats,CritStats,CorrStats,conf.level=conf.level)[[1]])
  temptab <- rbind(temptab[-1,])
  rownames(temptab) <- rownames(PredStats)
  std <- PredStats[,"SD"]/CritStats[,"SD"]
  results <- rbind(temptab*std)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Standardized Regression Coefficients"} else {names(results) <- main}  
  return(results)
}

estimateStandardizedRegression.default <- function(Predictors,Criterion,conf.level=.95,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  estimateStandardizedRegression(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

### Confidence Interval Plots

plotStandardizedRegression <- function(x,...) 
  UseMethod("plotStandardizedRegression")

plotStandardizedRegression.wss <- function(PredStats,CritStats,CorrStats,main=NULL,ylab="Standardized Coefficient",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateStandardizedRegression(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Regression Coefficients"} else {main="Confidence Interval for the \n Standardized Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=22)
}

plotStandardizedRegression.default <- function(Predictors,Criterion,main=NULL,ylab="Standardized Coefficient",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateStandardizedRegression(Predictors,Criterion,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the \n Standardized Regression Coefficients"} else {main="Confidence Interval for the \n Standardized Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=22)
}
