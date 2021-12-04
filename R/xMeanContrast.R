# Estimation Approach to Statistical Inference
## Mean Contrasts

### Confidence Intervals

.estimateMeanContrast <- function(x,...) 
  UseMethod(".estimateMeanContrast")

.estimateMeanContrast.wss <- function(DescStats,CorrStats,contrast,conf.level=.95,labels=NULL) {
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

.estimateMeanContrast.bss <- function(DescStats,contrast,conf.level=.95,labels=NULL) {
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

.estimateMeanContrast.default <- function(...,contrast,conf.level=.95,labels=NULL) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateMeanContrast.wss(DescStats,CorrStats,contrast,conf.level=conf.level,labels=labels)
}

.estimateMeanContrast.formula <- function(formula,contrast,conf.level=.95,labels=NULL) {
  DescStats <- .describeMeans(formula)
  .estimateMeanContrast.bss(DescStats,contrast,conf.level=conf.level,labels=labels)
}

estimateMeanContrast <- function(...,main=NULL,digits=3) {
  results <- .estimateMeanContrast(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results)="Confidence Interval for the Mean Contrast"} else {names(results) <- main}
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanContrast <- function(x,...) 
  UseMethod(".testMeanContrast")
  
.testMeanContrast.bss <- function(DescStats,contrast,mu=0,labels=NULL) {
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

.testMeanContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,labels=NULL) {
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

.testMeanContrast.default <- function(...,contrast,mu=0,labels=NULL) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .testMeanContrast.wss(DescStats,CorrStats,contrast,mu=mu,labels=labels)
}

.testMeanContrast.formula <- function(formula,contrast,mu=0,labels=NULL) {
  DescStats <- .describeMeans(formula)
  .testMeanContrast.bss(DescStats,contrast,mu=mu,labels=labels)
}

testMeanContrast <- function(...,main=NULL,digits=3) {
  results <- .testMeanContrast(...)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results)="Hypothesis Test for the Mean Contrast"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Plots

plotMeanContrast <- function(...,main=NULL,digits=3,ylab="Mean Contrast",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,pch=17,col="black") {
  results <- estimateMeanContrast(...,conf.level=conf.level,main=main,digits=digits)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,4,5)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
}
