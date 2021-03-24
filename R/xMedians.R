# Estimation Approach to Statistical Inference
## Functions for Medians

### Descriptive Functions

.dsMedian <- function(x) {
  N <- length(x)
  Range <- max(x)-min(x)
  Mdn <- median(x)
  results <- cbind(N,Mdn,Range)
  colnames(results) <- c("N","Mdn","Range")  
  rownames(results) <- deparse(substitute(x))
  return(results)
}

describeMedians <- function(x,...)
  UseMethod("describeMedians")

describeMedians.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- sapply(data,.dsMedian)
  results <- t(results)
  colnames(results) <- c("N","Mdn","Range") 
  if(is.null(main)) {if(nrow(results)>1) {main="Descriptive Statistics for the Variables"} else {main="Descriptive Statistics for the Variable"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

describeMedians.formula <- function(formula,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=describeMedians)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  if(is.null(main)) {if(nrow(results)>1) {main="Descriptive Statistics for the Variables"} else {main="Descriptive Statistics for the Variable"}}  
  results <- list(results)
  names(results) <- main  
  return(results)
}

### Confidence Interval Functions

.ciMedian <- function(x,conf.level=.95) {
  alpha <- 1-conf.level
  n <- length(x)
  y <- sort(x)
  z <- qnorm(1 - alpha/2)
  c1 <- round((n - z*sqrt(n))/2)
  if (c1 < 1) {c1 = 1}
  Mdn <- median(y)
  LL <- y[c1]
  UL <- y[n - c1 + 1]
  a <- round((n + 1)/2 - sqrt(n))
  if (a < 1) {a = 1}
  L1 <- y[a]
  U1 <- y[n - a + 1]
  p <- pbinom(a - 1, size = n, prob = .5)
  z0 <- qnorm(1 - p)
  SE <- (U1 - L1)/(2*z0)
  results <- cbind(Mdn,SE,LL,UL)
  colnames(results) <- c("Mdn","SE","LL","UL") 
  rownames(results) <- deparse(substitute(x))
  return(results)
}

estimateMedians <- function(x,...)
  UseMethod("estimateMedians")

estimateMedians.default <- function(...,conf.level=.95,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- sapply(data,.ciMedian,conf.level=conf.level)
  results <- t(results)
  colnames(results) <- c("Mdn","SE","LL","UL") 
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Medians"} else {main="Confidence Interval for the Median"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main   
  return(results)
}

estimateMedians.formula <- function(formula,conf.level=.95,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=estimateMedians,conf.level=conf.level)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Medians"} else {main="Confidence Interval for the Median"}}  
  results <- list(results)
  names(results) <- main  
  return(results)
}

### Confidence Interval Plot Functions

plotMedians <- function(x,...) 
  UseMethod("plotMedians")

plotMedians.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMedians(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Medians"} else {main="Confidence Interval for the Median"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,add=add)
}

plotMedians.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,add=FALSE,values=TRUE,ylim=NULL,digits=3) {
  results <- .unformatFrame(estimateMedians(formula=formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Medians"} else {main="Confidence Interval for the Median"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,add=add)
}
