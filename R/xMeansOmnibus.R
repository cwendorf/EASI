# Estimation Approach to Statistical Inference
## Mean Omnibus Analyses (Analysis of Variance)

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
  results <- .formatList(list(results),digits=digits)   
  if(is.null(main)) {names(results) <- "Source Table"} else {names(results) <- main} 
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
  results <- .formatList(list(results),digits=digits)   
  if(is.null(main)) {names(results) <- "Hypothesis Test"} else {names(results) <- main} 
  return(results)
}
