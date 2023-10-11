# Estimation Approach to Statistical Inference
## Mean Contrasts

### Confidence Intervals

.estimateMeanContrast <- function(x,...)
  UseMethod(".estimateMeanContrast")

.estimateMeanContrast.wss <- function(DescStats,CorrStats,contrast,conf.level=.95,labels=NULL,...) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.estimateMeanContrast.bss <- function(DescStats,contrast,conf.level=.95,labels=NULL,...) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.estimateMeanContrast.default <- function(frame,contrast,conf.level=.95,labels=NULL,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeanContrast.wss(DescStats,CorrStats,contrast,conf.level=conf.level,labels=labels)
}

.estimateMeanContrast.formula <- function(formula,contrast,conf.level=.95,labels=NULL,...) {
  DescStats <- .describeMeans(formula)
  .estimateMeanContrast.bss(DescStats,contrast,conf.level=conf.level,labels=labels)
}

estimateMeanContrast <- function(...,main=NULL,digits=3) {
  results <- .estimateMeanContrast(...)
  if(is.null(main)) {main <- "Confidence Interval for the Mean Contrast"}
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanContrast <- function(x,...)
  UseMethod(".testMeanContrast")
  
.testMeanContrast.bss <- function(DescStats,contrast,mu=0,labels=NULL,...) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.testMeanContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,labels=NULL,...) {
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
  if(is.null(labels)) {rownames(results) <- c("Contrast")} else {rownames(results) <- labels}
  return(results)
}

.testMeanContrast.default <- function(frame,contrast,mu=0,labels=NULL,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .testMeanContrast.wss(DescStats,CorrStats,contrast,mu=mu,labels=labels)
}

.testMeanContrast.formula <- function(formula,contrast,mu=0,labels=NULL,...) {
  DescStats <- .describeMeans(formula)
  .testMeanContrast.bss(DescStats,contrast,mu=mu,labels=labels)
}

testMeanContrast <- function(...,main=NULL,digits=3) {
  results <- .testMeanContrast(...)
  if(is.null(main)) {main <- "Hypothesis Test for the Mean Contrast"}
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Interval Plots

plotMeanContrast <- function(...,main=NULL,digits=3,ylab="Mean Contrast",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,connect=FALSE,values=TRUE,pos=2,ylim=NULL,add=FALSE,pch=17,col="black",offset=0,intervals=TRUE) {
  results <- estimateMeanContrast(...,conf.level=conf.level,main=main,digits=digits)
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,pch=pch,col=col,offset=offset,intervals=intervals)
}
