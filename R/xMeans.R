# Estimation Approach to Statistical Inference
## Means

### Descriptives

.skewness <- function(x, na.rm = FALSE, type = 2) {
  if(any(ina <- is.na(x))) {
    if(na.rm) x <- x[!ina]
    else return(NA)}
  if(!(type %in% (1 : 3))) stop("Invalid 'type' argument.")
  n <- length(x)
  x <- x - mean(x)
  y <- sqrt(n) * sum(x ^ 3) / (sum(x ^ 2) ^ (3/2))
  if(type == 2) {
    if(n < 3) stop("Need at least 3 complete observations.")
    y <- y * sqrt(n * (n - 1)) / (n - 2)} 
    else if(type == 3) y <- y * ((1 - 1 / n)) ^ (3/2)
  y
}

.kurtosis <- function(x, na.rm = FALSE, type = 2) {
  if(any(ina <- is.na(x))) {
    if(na.rm) x <- x[!ina]
    else return(NA)}
  if(!(type %in% (1 : 3))) stop("Invalid 'type' argument.")
  n <- length(x)
  x <- x - mean(x)
  r <- n * sum(x ^ 4) / (sum(x ^ 2) ^ 2)
  y <- if(type == 1) r - 3
  else if(type == 2) {
    if(n < 4) stop("Need at least 4 complete observations.")
    ((n + 1) * (r - 3) + 6) * (n - 1) / ((n - 2) * (n - 3))}
    else r * (1 - 1 / n) ^ 2 - 3
  y
}

.describeMeans <- function(x,...) 
  UseMethod(".describeMeans")

.describeMeans.default <- function(frame,...) {
  if(typeof(frame)=="double") {
    data <- data.frame(frame)
    if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}} 
    else {data=frame}
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  Skew <- sapply(data,.skewness,na.rm=TRUE)
  Kurt <- sapply(data,.kurtosis,na.rm=TRUE)
  results <- cbind(N=N,M=M,SD=SD,Skew=Skew,Kurt=Kurt)
  return(results)
}

.describeMeans.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=.describeMeans)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD","Skew","Kurt")
  return(results)
}

describeMeans <- function(...,main=NULL,digits=3) {
  results <- .describeMeans(...)
  if(is.null(main)) {main <- "Descriptive Statistics for the Data"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Intervals

.estimateMeans <- function(x,...) 
  UseMethod(".estimateMeans")

.estimateMeans.wss <- .estimateMeans.bss <- function(DescStats,mu=0,conf.level=.95,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Diff <- M-mu
  df <- N-1
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Diff-tcrit*SE
  UL <- Diff+tcrit*SE
  results <- data.frame(Diff=Diff,SE=SE,df=df,LL=LL,UL=UL)
  if(mu==0) colnames(results)[1]="M"
  rownames(results) <- rownames(DescStats)
  return(results)
}

.estimateMeans.default <- function(frame,mu=0,conf.level=.95,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  DescStats <- .describeMeans.default(data)
  .estimateMeans.wss(DescStats,conf.level=conf.level,mu=mu)
}

.estimateMeans.formula <- function(formula,mu=0,conf.level=.95,...) {
  DescStats <- .describeMeans.formula(formula)
  .estimateMeans.bss(DescStats,conf.level=conf.level,mu=mu)
}

estimateMeans <- function(...,main=NULL,digits=3) {
  results <- .estimateMeans(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Confidence Intervals for the Means"} else {main <- "Confidence Interval for the Mean"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Null Hypothesis Significance Tests

.testMeans <- function(x,...) 
  UseMethod(".testMeans")
  
.testMeans.wss <- .testMeans.bss <- function(DescStats,mu=0,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=Diff,SE=SE,df=df,t=t,p=p)
  rownames(results) <- rownames(DescStats)
  return(results)
}

.testMeans.default <- function(frame,mu=0,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}  
  DescStats <- .describeMeans.default(data)
  .testMeans.wss(DescStats,mu=mu,main=main,digits=digits)
}

.testMeans.formula <- function(formula,mu=0,...) {
  DescStats <- .describeMeans.formula(formula,...)
  .testMeans.bss(DescStats,mu=mu,main=main,digits=digits)
}

testMeans <- function(...,main=NULL,digits=3) {
  results <- .testMeans(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Hypothesis Tests for the Means"} else {main <- "Hypothesis Test for the Mean"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Interval Plots

plotMeans <- function(...,mu=0,conf.level=.95,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,line=NULL,rope=NULL,values=TRUE,digits=3,pos=2,pch=16,col="black",connect=NULL) {
  results <- estimateMeans(...,mu=mu,conf.level=conf.level,main=main,digits=digits)
  if(is.null(connect) & length(list(...))>1) {connect=TRUE} else {connect=FALSE}
  plotIntervals(results,add=add,main=main,xlab=xlab,ylab=ylab,ylim=ylim,values=values,line=line,rope=rope,digits=digits,connect=connect,pos=pos,col=col)
}
