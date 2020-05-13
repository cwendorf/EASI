# Estimation Approach to Statistical Inference
## Functions for Means and Mean Differences

### Descriptive Functions

#### Describe Function for Means

describeMeans <- describeMean <- function(x,...) 
  UseMethod("describeMeans")

describeMeans.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- cbind(N=N,M=M,SD=SD)
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

describeMeans.formula <- function(formula,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=describeMeans)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  results <- list(results)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

### Confidence Interval Functions

#### CI Function for Means

estimateMeans <- function(x,...) 
  UseMethod("estimateMeans")

estimateMeans.wss <- estimateMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- data.frame(M=M,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main   
  return(results)
}

estimateMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)
}

estimateMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Means

testMeans <- testMean <- function(x,...) 
  UseMethod("testMeans")
  
testMeans.wss <- testMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=Diff,SE=SE,df=df,t=t,p=p)
  rownames(results) <- rownames(DescStats)
  if(is.null(main)) {if(nrow(results)>1) {main="Hypothesis Tests for the Means"} else {main="Hypothesis Test for the Mean"}}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main   
  return(results)
}

testMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  testMeans(DescStats,mu=mu,main=main,digits=digits)
}

testMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testMeans(DescStats,mu=mu,main=main,digits=digits)
}

### Standardized Mean Difference Functions

#### SMD Function for Means

standardizeMeans <- standardizeMean <- function(x,...) 
  UseMethod("standardizeMeans")
  
standardizeMeans.wss <- standardizeMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)  
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  alpha <- 1-conf.level
  CD <- Diff/SD
  CDU <- (1-3/(4*df-1))*CD
  SE <- sqrt((df+2)/(N^2)+((CD^2)/(2*(df+2))))
  k <- exp(((log(2)-log(df))/2)+lgamma((df+1)/2)-lgamma(df/2))
  m <- t*k
  v <- 1+(t^2)*(1-k^2)
  w <- (2*m^3)-((2*df-1)/df)*(t^2*m)
  skew <- abs(w/sqrt(v)^3)
  sdz <- sqrt(v)
  llz <- qnorm(1-alpha/2,lower.tail=FALSE)
  ulz <- qnorm(1-alpha/2)
  ll1 <- m+sdz*llz
  ul1 <- m+sdz*ulz
  c <- w/(4*v)
  q <- v/(2*c^2)
  a <- m-(q*c)
  llp <- 2*(qgamma(alpha/2,q/2,rate=1))
  ulp <- 2*(qgamma(1-alpha/2,q/2,rate=1))
  ll2 <- ifelse(t>0,a+c*llp,a+c*ulp)
  ul2 <- ifelse(t>0,a+c*ulp,a+c*llp)
  LL <- ifelse(skew<.001,ll1*sqrt(1/N),ll2*sqrt(1/N))
  UL <- ifelse(skew<.001,ul1*sqrt(1/N),ul2*sqrt(1/N))
  results <- data.frame(d=CD,SE=SE,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Standardized Means"} else {main="Confidence Interval for the Standardized Mean"}}  
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main    
  return(results)
}

standardizeMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  standardizeMeans(DescStats,mu=mu,conf.level=conf.level,mainmain=main,digits=digits)
}

standardizeMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  standardizeMeans(DescStats,mu=mu,conf.level=conf.level,main=main,digits=digits)
}

### Plot Functions

#### Plot Function for Confidence Intervals of the Means

plotMeans <- plotMean <- function(x,...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotMeans.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  results <- .unformatFrame(estimateMeans(DescStats,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
}

plotMeans.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  results <- .unformatFrame(estimateMeans(...,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=TRUE)
}

plotMeans.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  results <- .unformatFrame(estimateMeans(formula=formula,conf.level=conf.level,main=main,digits=digits)[[1]][,c(1,4,5)])
  if(is.null(main)) {if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}}  
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits,connect=FALSE)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Mean Functions

analyzeMeans <- function(...,main=NULL,digits=3) {
  eM <- estimateMeans(...,digits=digits)
  tM <- testMeans(...,digits=digits)
  sM <- standardizeMeans(...,digits=digits)
  results <- c(eM,tM,sM)
  plotMeans(...,main=main,digits=digits)
  return(results)
}
