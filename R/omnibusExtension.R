# Estimation Approach to Statistical Inference
## Extension for Omnibus (Analysis of Variance) Analyses

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Descriptive Functions

descOmnibus <- function(...) 
  UseMethod("descOmnibus")

descOmnibus.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  n <- DescStats[,"N"]
  m <- DescStats[,"M"]
  sd <- DescStats[,"SD"]
  cov <- cor2cov(CorrStats,sd)
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
  return(results)
}

descOmnibus.bss <- function(DescStats,conf.level=.95,...) {
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

descOmnibus.default <- function(...,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)  
  results <- descOmnibus(DescStats,CorrStats,conf.level=conf.level)
  return(results)
}

descOmnibus.formula <- function(formula,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- descOmnibus(DescStats,conf.level=conf.level)
  return(results)
}

describeOmnibus <- function(...,digits=3) {
  cat("\nANALYSIS OF VARIANCE SOURCE TABLE\n\n")
  print(formatFrame(descOmnibus(...),digits=digits))
  cat("\n")
}

### Null Hypothesis Significance Test Functions

nhstOmnibus <- function(...) 
  UseMethod("nhstOmnibus")

nhstOmnibus.wss <- function(DescStats,CorrStats) {
  temptab <- descOmnibus(DescStats,CorrStats)
  MSf <- temptab["Factor","MS"]
  MSe <- temptab["Error","MS"]
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"]
  F <- MSf/MSe
  p <- 1-pf(F,dff,dfe)
  results <- cbind(F,dff,dfe,p)
  colnames(results) <- c("F","dff","dfe","p")
  rownames(results) <- c("Omnibus")  
  return(results)
}

nhstOmnibus.bss <- function(DescStats) {
  temptab <- descOmnibus(DescStats)
  MSb <- temptab["Between","MS"]
  MSw <- temptab["Within","MS"]
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"]
  F <- MSb/MSw
  p <- 1-pf(F,dfb,dfw)
  results <- cbind(F,dfb,dfw,p)
  colnames(results) <- c("F","dfb","dfw","p")
  rownames(results) <- c("Omnibus")  
  return(results)
}

nhstOmnibus.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)  
  results <- nhstOmnibus(DescStats,CorrStats)
  return(results)
}

nhstOmnibus.formula <- function(formula,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- nhstOmnibus(DescStats)
  return(results)
}

testOmnibus <- function(...,digits=3) {
  cat("\nHYPOTHESIS TEST FOR THE OMNIBUS EFFECT\n\n")
  print(formatFrame(nhstOmnibus(...),digits=digits))
  cat("\n")
}
