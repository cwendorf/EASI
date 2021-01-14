# Estimation Approach to Statistical Inference
## Functions for Regression Coefficients

### Confidence Interval Functions

estimateRegression <- estimateRegrssionCoefficients <- function(x,...) 
  UseMethod("estimateRegression")

estimateRegression.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3) {
  DescStats <- rbind(PredStats,CritStats)
  rn <- rownames(DescStats)
  CorrStats <- CorrStats[rn,rn]
  M <- DescStats[,"M"]
  V <- .cortocov(CorrStats,DescStats[,"SD"])
  N <- DescStats[1,"N"]
  k <- nrow(DescStats)-1
  M <- M * N
  V <- V * (N-1)
  V <- V + outer(M, M)/N
  V <- rbind(c(N, M), cbind(M, V))
  XX <- V[-(k+2), -(k+2)]
  XY <- V[-(k+2), k+2]
  YY <- V[k+2, k+2]
  b <- solve(XX, XY)
  df <- N-k-1
  s2 <- (YY - b %*% XY) / df
  SE <- sqrt(diag(solve(XX) * c(s2)))
  alpha.lower <- alpha.upper <- (1-conf.level)/2
  LL <- b+qt(alpha.lower,df)*SE
  UL <- b+qt(1-alpha.upper,df)*SE
  results <- cbind(Est=b,SE=SE,LL=LL,UL=UL)
  rownames(results)[1]="(Intercept)"
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Regression Coefficients"} else {names(results) <- main}  
  return(results)
}

estimateRegression.default <- function(Predictors,Criterion,conf.level=.95,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  estimateRegression(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

testRegression <- testRegresssionCoefficients <- function(x,...) 
  UseMethod("testRegression")

testRegression.wss <- function(PredStats,CritStats,CorrStats,main=NULL,digits=3) {
  DescStats <- rbind(PredStats,CritStats)
  rn <- rownames(DescStats)
  CorrStats <- CorrStats[rn,rn]
  M <- DescStats[,"M"]
  V <- .cortocov(CorrStats,DescStats[,"SD"])
  N <- DescStats[1,"N"]
  k <- nrow(DescStats)-1
  M <- M * N
  V <- V * (N-1)
  V <- V + outer(M, M)/N
  V <- rbind(c(N, M), cbind(M, V))
  XX <- V[-(k+2), -(k+2)]
  XY <- V[-(k+2), k+2]
  YY <- V[k+2, k+2]
  b <- solve(XX, XY)
  df <- N-k-1
  s2 <- (YY - b %*% XY) / df
  SE <- sqrt(diag(solve(XX) * c(s2)))
  t <- b/SE
  p <- 2*pt(abs(t),df,lower.tail = FALSE)
  results <- cbind(Est=b,SE=SE,t=t,p=p)
  rownames(results)[1]="(Intercept)"
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Hypothesis Tests for the Regression Coefficients"} else {names(results) <- main}  
  return(results)
}

testRegression.default <- function(Predictors,Criterion,main=NULL,digits=3) {
  PredStats <- .unformatFrame(describeMeans(Predictors)[[1]])
  class(PredStats) <- "wss"
  CritStats <- .unformatFrame(describeMeans(Criterion)[[1]])
  class(CritStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(Predictors,Criterion)[[1]])
  class(CorrStats) <- "wss"
  testRegression(PredStats,CritStats,CorrStats,main=main,digits=digits)
}

### Confidence Interval Plot Functions

plotRegression <- plotRegressionCoefficients <- function(x,...) 
  UseMethod("plotRegression")

plotRegression.wss <- function(PredStats,CritStats,CorrStats,intercept=TRUE,main=NULL,ylab="Coefficient",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateRegression(PredStats,CritStats,CorrStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(intercept=="FALSE") {results <- tail(results,-1)}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Regression Coefficients"} else {main="Confidence Intervals for the Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}

plotRegression.default <- function(Predictors,Criterion,intercept=TRUE,main=NULL,ylab="Coefficient",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateRegression(Predictors,Criterion,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(intercept=="FALSE") {results <- tail(results,-1)}
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Regression Coefficients"} else {main="Confidence Intervals for the Regression Coefficient"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE)
}
