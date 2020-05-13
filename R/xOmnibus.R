# Estimation Approach to Statistical Inference
## Functions for Omnibus (Analysis of Variance) Analyses

### Descriptive Functions

describeOmnibus <- function(x,...) 
  UseMethod("describeOmnibus")

describeOmnibus.wss <- function(DescStats,CorrStats,main=NULL,digits=3,...) {
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

describeOmnibus.bss <- function(DescStats,main=NULL,digits=3,...) {
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

describeOmnibus.default <- function(...,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]]) 
  results <- describeOmnibus(DescStats,CorrStats,main=main,digits=digits)
  return(results)
}

describeOmnibus.formula <- function(formula,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  results <- describeOmnibus(DescStats,main=main,digits=digits)
  return(results)
}

### Null Hypothesis Significance Test Functions

testOmnibus <- function(x,...) 
  UseMethod("testOmnibus")

testOmnibus.wss <- function(DescStats,CorrStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
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

testOmnibus.bss <- function(DescStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeOmnibus(DescStats,main=main,digits=digits)[[1]])
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

testOmnibus.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]]) 
  testOmnibus(DescStats,CorrStats,main=main,digits=digits)
}

testOmnibus.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  testOmnibus(DescStats,main=main,digits=digits)
}

### Omnibus Effect Size

.ncpF <- function(x,df1,df2,prob,interval=c(0,10000),my.tol=0.000001) {
  temp <- function(ncp) pf(x,df1,df2,ncp) - prob
  return(uniroot(temp, interval, tol = my.tol)$root)
}

effectOmnibus <- function(x,...) 
  UseMethod("effectOmnibus")

effectOmnibus.bss <- function(DescStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeOmnibus(DescStats,main=main,digits=digits)[[1]])
  SSb <- temptab["Between","SS"]
  SSw <- temptab["Within","SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"] 
  dft <- dfb + dfw
  F <- (SSb/dfb)/(SSw/dfw) 
  etasq <- SSb / SSt
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(.ncpF(F,dfb,dfw,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(.ncpF(F,dfb,dfw,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  etasq.lower <- delta.lower / (delta.lower + dfb + dfw + 1)
  etasq.upper <- delta.upper / (delta.upper + dfb + dfw + 1)
  results <- cbind(Est=etasq,LL=etasq.lower,UL=etasq.upper)
  rownames(results) <- "Omnibus"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For By the Omnibus Effect"} else {names(results) <- main}  
  return(results)
}

effectOmnibus.wss <- function(DescStats,CorrStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeOmnibus(DescStats,CorrStats,main=main,digits=digits)[[]])
  SSf <- temptab["Factor","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"] 
  dft <- dff + dfe
  F <- (SSf/dff)/(SSe/dfe)
  etasq <- SSf / SSt
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(.ncpF(F,dff,dfe,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(.ncpF(F,dff,dfe,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  etasq.lower <- delta.lower / (delta.lower + dff + dfe + 1)
  etasq.upper <- delta.upper / (delta.upper + dff + dfe + 1)
  results <- cbind(Est=etasq,LL=etasq.lower,UL=etasq.upper)
  rownames(results) <- "Omnibus"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For By the Omnibus Effect"} else {names(results) <- main}  
  return(results)
}

effectOmnibus.default <- function(...,mu=0,conf.level=.90,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])  
  effectOmnibus(DescStats,CorrStats,main=main,digits=digits)
}

effectOmnibus.formula <- function(formula,mu=0,conf.level=.90,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  effectOmnibus(DescStats,conf.level,main=main,digits=digits)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Omnibus Functions

analyzeOmnibus <- function(...,main=NULL,digits=3) {
  dO <- describeOmnibus(...,digits=digits)
  tO <- testOmnibus(...,digits=digits)
  eO <- effectOmnibus(...,digits=digits)
  results <- c(dO,tO,eO)
  return(results)
}
