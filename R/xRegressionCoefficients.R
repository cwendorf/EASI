# Estimation Approach to Statistical Inference
## Regression Coefficients

### Confidence Intervals

.estimateRegressionCoefficients <- function(x,...) 
  UseMethod(".estimateRegressionCoefficients")

.estimateRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,conf.level=.95,...) {
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
  rownames(results)[1] <- "(Intercept)"
  return(results)
}

.estimateRegressionCoefficients.default <- function(Predictors,Criterion,conf.level=.95,...) {
  Pred <- data.frame(Predictors)
  if(ncol(Pred)==1) {colnames(Pred) <- deparse(substitute(Predictors))}  
  Crit <- data.frame(Criterion)
  PredStats <- .describeMeans.default(Pred)
  rownames(PredStats) <- colnames(Pred)
  CritStats <- .describeMeans.default(Crit)
  rownames(CritStats) <- colnames(Crit)
  CorrStats <- .describeCorrelations(cbind(Pred,Crit))
  .estimateRegressionCoefficients.wss(PredStats,CritStats,CorrStats,conf.level=conf.level)
}

estimateRegressionCoefficients <- function(...,main=NULL,digits=3) {
  results <- .estimateRegressionCoefficients(...)
  if(is.null(main)) {main <- "Confidence Intervals for the Regression Coefficients"}
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Null Hypothesis Significance Tests

.testRegressionCoefficients <- function(x,...) 
  UseMethod(".testRegressionCoefficients")

.testRegressionCoefficients.wss <- function(PredStats,CritStats,CorrStats,...) {
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
  return(results)
}

.testRegressionCoefficients.default <- function(Predictors,Criterion,...) {
  Pred <- data.frame(Predictors)
  if(ncol(Pred)==1) {colnames(Pred) <- deparse(substitute(Predictors))} 
  Crit <- data.frame(Criterion)
  PredStats <- .describeMeans.default(Pred)
  rownames(PredStats) <- colnames(Pred)
  CritStats <- .describeMeans.default(Crit)
  rownames(CritStats) <- colnames(Crit)
  CorrStats <- .describeCorrelations(cbind(Pred,Crit))
  .testRegressionCoefficients.wss(PredStats,CritStats,CorrStats)
}

testRegressionCoefficients <- function(...,main=NULL,digits=3) {
  results <- .testRegressionCoefficients(...)
  if(is.null(main)) {main <- "Hypothesis Tests for the Regression Coefficients"}
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Interval Plots

plotRegressionCoefficients <- function(...,intercept=TRUE,main=NULL,digits=3,ylab="Regression Coefficient",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,pos=2,connect=FALSE,ylim=NULL,add=FALSE,pch=15,col="black") {
  results <- estimateRegressionCoefficients(...,conf.level=conf.level,main=main,digits=digits)
  if(intercept=="FALSE") {results[[1]] <- tail(results[[1]],-1)}  
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col)
}
