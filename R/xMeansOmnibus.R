# Estimation Approach to Statistical Inference
## Functions for Mean Omnibus (Analysis of Variance) Analyses

### Descriptive Functions

describeMeansOmnibus <- describeMeanOmnibus <- function(x,...) 
  UseMethod("describeMeanOmnibus")

describeMeansOmnibus.wss <- function(DescStats,CorrStats,main=NULL,digits=3,...) {
  n <- DescStats[,"N"]
  m <- DescStats[,"M"]
  sd <- DescStats[,"SD"]
  cov <- .cortocov(CorrStats,sd)
  Mcov <- mean(cov[lower.tri(cov)])
  a <- length(m)
  Mt <- mean(m)
  N <- sum(n)
  dfa <- a-1
  MSa <- sum(n*(m-Mt)^2)/(a-1)
  SSa <- dfa * MSa
  dfw <- N-a
  MSw <- sum((n-1)*sd^2)/sum(n-1)
  SSw <- dfw * MSw  
  MSas <- MSw-Mcov
  dfas <- (a-1)*(n[[1]]-1)
  SSas <- dfas * MSas
  dfs <- n[[1]]-1
  SSs <- SSw - SSas
  MSs <- SSs/dfs
  results <- rbind(c(SSs,dfs,MSs),c(SSa,dfa,MSa),c(SSas,dfas,MSas))
  colnames(results) <- c("SS","df","MS")
  rownames(results) <- c("Subject","Factor","Error")
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Analysis of Variance Source Table"} else {names(results) <- main}
  return(results)
}

describeMeansOmnibus.bss <- function(DescStats,main=NULL,digits=3,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  k  <- length(M)
  dfb <- k - 1
  dfw   <- sum(N) - k
  Xg  <- sum(N*M)/sum(N)
  MSb <- sum(N * (M - Xg)^2)/(k-1)
  MSw <-  sum((N-1)*SD^2)/dfw
  SSb <- dfb * MSb
  SSw <- dfw * MSw
  results <- rbind(c(SSb,dfb,MSb),c(SSw,dfw,MSw))
  colnames(results) <- c("SS","df","MS")
  rownames(results) <- c("Between","Within")
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Analysis of Variance Source Table"} else {names(results) <- main}
  return(results)
}

describeMeansOmnibus.default <- function(...,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]]) 
  results <- describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)
  return(results)
}

describeMeansOmnibus.formula <- function(formula,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  results <- describeMeansOmnibus(DescStats,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Test Functions

testMeansOmnibus <- testMeanOmnibus <- function(x,...) 
  UseMethod("testMeanOmnibus")

testMeansOmnibus.wss <- function(DescStats,CorrStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  MSf <- temptab["Factor","MS"]
  MSe <- temptab["Error","MS"]
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"]
  F <- MSf/MSe
  p <- 1-pf(F,dff,dfe)
  results <- cbind(F,dff,dfe,p)
  colnames(results) <- c("F","dff","dfe","p")
  rownames(results) <- c("Omnibus")
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Omnibus Effect"} else {names(results) <- main}
  return(results)
}

testMeansOmnibus.bss <- function(DescStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
  MSb <- temptab["Between","MS"]
  MSw <- temptab["Within","MS"]
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"]
  F <- MSb/MSw
  p <- 1-pf(F,dfb,dfw)
  results <- cbind(F,dfb,dfw,p)
  colnames(results) <- c("F","dfb","dfw","p")
  rownames(results) <- c("Omnibus")  
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Omnibus Effect"} else {names(results) <- main}
  return(results)
}

testMeansOmnibus.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]]) 
  testMeanOmnibus(DescStats,CorrStats,main=main,digits=digits)
}

testMeansOmnibus.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testMeanOmnibus(DescStats,main=main,digits=digits)
}
