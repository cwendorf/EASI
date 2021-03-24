# Estimation Approach to Statistical Inference
## Functions for Median Differences

### Confidence Interval Functions

estimateMedianDifference <- function(x,...)
  UseMethod("estimateMedianDifference")

estimateMedianDifference.default <- function(...,conf.level=.95,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMedians(...)[[1]])
  n <- DescStats[1,"N"]
  CompStats <- .unformatFrame(estimateMedians(...,conf.level=conf.level)[[1]])
  median1 <- CompStats[1,"Mdn"]
  median2 <- CompStats[2,"Mdn"]
  se1 <- CompStats[1,"SE"]
  se2 <- CompStats[2,"SE"]
  alpha <- 1-conf.level
  z <- qnorm(1 - alpha/2)
  a1 <- (y1 < median1)
  a2 <- (y2 < median2)
  a3 <- a1 + a2
  a4 <- sum(a3 == 2)
  if (n/2 == trunc(n/2)) {p00 <- (sum(a4)+.25)/(n + 1)} 
  else {p00 <- (sum(a4) + .25)/n}
  cov <- (4*p00 - 1)*se1*se2
  Diff <- median2 - median1
  SE <- sqrt(se1^2 + se2^2 - 2*cov)
  LL <- Diff - z*SE
  UL <- Diff + z*SE
  results <- cbind(Diff,SE,LL,UL)
  colnames(results) <- c("Diff","SE","LL","UL")
  rownames(results) <- "Comparison"
  if(is.null(main)) {main="Confidence Interval for the Median Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

estimateMedianDifference.formula <- function(formula,conf.level=.95,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMedians(formula)[[1]])
  n <- DescStats[1,"N"]
  CompStats <- .unformatFrame(estimateMedians(formula,conf.level=conf.level)[[1]])
  median1 <- CompStats[1,"Mdn"]
  median2 <- CompStats[2,"Mdn"]
  se1 <- CompStats[1,"SE"]
  se2 <- CompStats[2,"SE"]
  alpha <- 1-conf.level
  z <- qnorm(1 - alpha/2)
  Diff <- median2 - median1
  SE <- sqrt(se1^2 + se2^2)
  LL <- Diff - z*SE
  UL <- Diff + z*SE
  results <- cbind(Diff,SE,LL,UL)
  colnames(results) <- c("Diff","SE","LL","UL")
  rownames(results) <- "Comparison"
  if(is.null(main)) {main="Confidence Interval for the Median Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

### Confidence Interval Plot Functions

plotMedianDifference <- function(x,...) 
  UseMethod("plotMedianDifference")

plotMedianDifference.default <- function(...,main=NULL,ylab="Median Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMedianDifference(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Median Difference"} 
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,pch=17)
}

plotMedianDifference.formula <- function(formula,main=NULL,ylab="Median Difference",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,digits=3,pch=NULL) {
  results <- .unformatFrame(estimateMedianDifference(formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,3,4)])
  if(is.null(main)) {main="Confidence Interval for the \n Median Difference"}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,pch=17)
}
