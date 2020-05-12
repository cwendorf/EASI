# Estimation Approach to Statistical Inference
## Functions for Means and Mean Differences

### Confidence Interval Functions

#### CI Function for Mean Differences/Comparisons

estimateDifference <- function(x,...) 
  UseMethod("estimateDifference")
  
estimateDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main 
  return(results)
}

estimateDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

estimateDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  estimateDifference(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- .descMeans(formula)
  class(CompStats) <- "bss"
  estimateDifference(CompStats,conf.level=conf.level,main=main,digits=digits)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Mean Differences/Comparisons

testDifference <- function(x,...) 
  UseMethod("testDifference")
  
testDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,df=df,t=t,p=p)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Hypothesis Test for the Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

testDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,df=df,t=t,p=p)
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Hypothesis Test for the Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

testDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  testDifference(CompStats,CorrStats,mu=mu,main=main,digits=digits)
}

testDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- .descMeans(formula)
  class(CompStats) <- "bss"
  testDifference(CompStats,mu=mu,main=main,digits=digits)
}

### Standardized Mean Difference Functions

#### SMD Function for Mean Differences/Comparisons

standardizeDifference <- function(x,...) 
  UseMethod("standardizeDifference")

standardizeDifference.wss <- function(DescStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- DescStats[1:2,]
  N <- min(CompStats[1:2,"N"])
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Standardized Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

standardizeDifference.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- DescStats[1:2,]
  N <- CompStats[1:2,"N"]
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Standardized Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

standardizeDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- data.matrix(describeCorrelations(...)[[1]])
  standardizeDifference(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

standardizeDifference.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .descMeans(formula)
  class(DescStats) <- "bss"
  standardizeDifference(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}

### Plot Functions

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotDifference <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  plotComparison(...,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Mean Difference/Comparison Functions

analyzeDifference <- function(...,main=NULL,digits=3) {
  eD <- estimateDifference(...,digits=digits)
  tD <- testDifference(...,digits=digits)
  sD <- standardizeDifference(...,digits=digits)
  results <- c(eD,tD,sD)
  plotDifference(...,main=main,digits=digits)
  return(results)
}
