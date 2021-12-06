# Estimation Approach to Statistical Inference
## Standardized Means

### Confidence Intervals

.estimateStandardizedMeans <- function(x,...) 
  UseMethod(".estimateStandardizedMeans")
  
.estimateStandardizedMeans.wss <- .estimateStandardizedMeans.bss <- function(DescStats,mu=0,conf.level=.95) {
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
  return(results)
}

.estimateStandardizedMeans.default <- function(...,mu=0,conf.level=.95) {
  DescStats <- .describeMeans(...)
  .estimateStandardizedMeans.wss(DescStats,mu=mu,conf.level=conf.level)
}

.estimateStandardizedMeans.formula <- function(formula,mu=0,conf.level=.95) {
  DescStats <- .describeMeans(formula)
  .estimateStandardizedMeans.bss(DescStats,mu=mu,conf.level=conf.level)
}

estimateStandardizedMeans <- function(...,main=NULL,digits=3) {
  results <- .estimateStandardizedMeans(...)
  if(is.null(main)) {if(nrow(results)>1) {main <- "Confidence Intervals for the Standardized Means"} else {main <- "Confidence Interval for the Standardized Mean"}}  
  results <- .formatList(list(results),main=main,digits=digits)  
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeans <- function(...,main=NULL,digits=3,ylab="Standardized Mean Difference",xlab="",mu=0,line=NULL,rope=NULL,conf.level=.95,values=TRUE,ylim=NULL,add=FALSE,pch=16,col="black") {
  results <- estimateStandardizedMeans(...,mu=mu,conf.level=conf.level,main=main,digits=digits)
  if (length(list(...))>1) {connect=TRUE} else if (class(...)=="wss") {connect=TRUE} else {connect=FALSE}
  if(is.null(main)) {main=names(results)} 
  results <- .unformatFrame(results[[1]][,c(1,3,4)])
 .cipMain(results,main=main,ylab=ylab,xlab=xlab,line=line,rope=rope,values=values,ylim=ylim,digits=digits,connect=connect,add=add,pch=pch,col=col)
}
