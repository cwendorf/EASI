# Estimation Approach to Statistical Inference
## Mean Contrasts

### Confidence Intervals

estimateMeanContrast <- function(x,...) 
  UseMethod("estimateMeanContrast")

estimateMeanContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- .cortocov(CorrStats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeanContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Confidence Interval for the Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateMeanContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateMeanContrast(DescStats,CorrStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

estimateMeanContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateMeanContrast(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Tests

testMeanContrast <- function(x,...) 
  UseMethod("testMeanContrast")
  
testMeanContrast.bss <- function(DescStats,contrast,mu=0,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,df,t,p)))
  colnames(results) <- c("Est","SE","df","t","p")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Hypothesis Test for the Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeanContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,rope=NULL,main=NULL,digits=3,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  covstats <- .cortocov(CorrStats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,df,t,p)))
  colnames(results) <- c("Est","SE","df","t","p")
  rownames(results) <- c("Contrast")
  if(is.null(main)) {main="Hypothesis Test for the Mean Contrast"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

testMeanContrast.default <- function(...,contrast,mu=0,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  testMeanContrast(DescStats,CorrStats,contrast,mu=mu,main=main,digits=digits)
}

testMeanContrast.formula <- function(formula,contrast,mu=0,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testMeanContrast(DescStats,contrast,mu=mu,main=main,digits=digits)
}

### Confidence Interval Plots

plotMeanContrast <- function(x,...) 
  UseMethod("plotMeanContrast")

plotMeanContrast.wss <- function(DescStats,CorrStats,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeanContrast(DescStats,CorrStats,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Contrast"} 
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotMeanContrast.bss <- function(DescStats,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeanContrast(DescStats,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Contrast"}   
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

plotMeanContrast.default <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeanContrast(...,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Contrast"} 
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=pch,col=col)
}

plotMeanContrast.formula <- function(formula,contrast,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=17,col="black") {
  results <- .unformatFrame(estimateMeanContrast(formula,contrast=contrast,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {main="Confidence Interval for the \n Mean Contrast"}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=pch,col=col)
}

