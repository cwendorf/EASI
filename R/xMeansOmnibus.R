# Estimation Approach to Statistical Inference
## Mean Omnibus (Analysis of Variance)

### Descriptives

.describeMeansOmnibus <- function(x,...) 
  UseMethod(".describeMeansOmnibus")

.describeMeansOmnibus.wss <- function(DescStats,CorrStats) {
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
  rownames(results) <- c("Subjects","Measures","Error")
  return(results)
}

.describeMeansOmnibus.bss <- function(DescStats) {
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
  return(results)
}

.describeMeansOmnibus.default <- function(...) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  results <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  return(results)
}

.describeMeansOmnibus.formula <- function(formula) {
  DescStats <- .describeMeans(formula)
  results <- .describeMeansOmnibus.bss(DescStats)
  return(results)
}

describeMeansOmnibus <- function(...,main=NULL,digits=3) {
  results <- .describeMeansOmnibus(...)
  if(is.null(main)) {main <- "Source Table"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibus <- function(x,...) 
  UseMethod(".testMeansOmnibus")

.testMeansOmnibus.wss <- function(DescStats,CorrStats) {
  temptab <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  MSf <- temptab["Measures","MS"]
  MSe <- temptab["Error","MS"]
  dff <- temptab["Measures","df"]
  dfe <- temptab["Error","df"]
  F <- MSf/MSe
  p <- 1-pf(F,dff,dfe)
  results <- cbind(F,dff,dfe,p)
  colnames(results) <- c("F","df1","df2","p")
  rownames(results) <- c("Measures")
  return(results)
}

.testMeansOmnibus.bss <- function(DescStats) {
  temptab <- .describeMeansOmnibus.bss(DescStats)
  MSb <- temptab["Between","MS"]
  MSw <- temptab["Within","MS"]
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"]
  F <- MSb/MSw
  p <- 1-pf(F,dfb,dfw)
  results <- cbind(F,dfb,dfw,p)
  colnames(results) <- c("F","df1","df2","p")
  rownames(results) <- c("Factor")  
  return(results)
}

.testMeansOmnibus.default <- function(...) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .testMeansOmnibus.wss(DescStats,CorrStats)
}

.testMeansOmnibus.formula <- function(formula) {
  DescStats <- .describeMeans(formula)
  .testMeansOmnibus.bss(DescStats)
}

testMeansOmnibus <- function(...,main=NULL,digits=3) {
  results <- .testMeansOmnibus(...)
  if(is.null(main)) {main <- "Hypothesis Test"}
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}

### Confidence Intervals

.estimateMeansOmnibus <- function(x,...) 
  UseMethod(".estimateMeansOmnibus")

.estimateMeansOmnibus.wss <- function(DescStats,CorrStats,conf.level=.90) {
  temptab <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  SSf <- temptab["Measures","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Measures","df"]
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
  rownames(results) <- "Measures"
  return(results)
}

.estimateMeansOmnibus.bss <- function(DescStats,conf.level=.90) {
  temptab <- .describeMeansOmnibus.bss(DescStats)
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
  rownames(results) <- "Factor"
  return(results)
}

.estimateMeansOmnibus.default <- function(...,conf.level=.90) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateMeansOmnibus.wss(DescStats,CorrStats,conf.level)
}

.estimateMeansOmnibus.formula <- function(formula,conf.level=.90) {
  DescStats <- .describeMeans(formula)
  .estimateMeansOmnibus.bss(DescStats,conf.level)
}

estimateMeansOmnibus <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansOmnibus(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"} 
  results <- .formatList(list(results),main=main,digits=digits) 
  return(results)
}
