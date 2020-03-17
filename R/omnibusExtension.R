# Estimation Approach to Statistical Inference
## Extension for Omnibus (Analysis of Variance) Analyses

### Descriptive Functions

descOmnibus <- function(...) 
  UseMethod("descOmnibus")

descOmnibus.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  n <- DescStats[,"N"]
  m <- DescStats[,"M"]
  sd <- DescStats[,"SD"]
  cov <- cortocov(CorrStats,sd)
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
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)  
  results <- descOmnibus(DescStats,CorrStats,conf.level=conf.level)
  return(results)
}

descOmnibus.formula <- function(formula,conf.level=.95,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- descOmnibus(DescStats,conf.level=conf.level)
  return(results)
}

describeOmnibus <- function(...,main=NULL,digits=3) {
  results <- formatList(list(descOmnibus(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Analysis of Variance Source Table"} else {names(results) <- main}
  return(results)
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
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)  
  results <- nhstOmnibus(DescStats,CorrStats)
  return(results)
}

nhstOmnibus.formula <- function(formula,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- nhstOmnibus(DescStats)
  return(results)
}

testOmnibus <- function(...,main=NULL,digits=3) {
  results <- formatList(list(nhstOmnibus(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Omnibus Effect"} else {names(results) <- main}
  return(results)
}

### Omnibus Effect Size

ncpF <- function(x,df1,df2,prob,interval=c(0,10000),my.tol=0.000001) {
  temp <- function(ncp) pf(x,df1,df2,ncp) - prob
  return(uniroot(temp, interval, tol = my.tol)$root)
}

pvaOmnibus <- function(...) 
  UseMethod("pvaOmnibus")

pvaOmnibus.bss <- function(DescStats,conf.level=.90) {
  temptab <- descOmnibus(DescStats)
  SSb <- temptab["Between","SS"]
  SSw <- temptab["Within","SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"] 
  dft <- dfb + dfw
  F <- (SSb/dfb)/(SSw/dfw) 
  etasq <- SSb / SSt
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(ncpF(F,dfb,dfw,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(ncpF(F,dfb,dfw,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  etasq.lower <- delta.lower / (delta.lower + dfb + dfw + 1)
  etasq.upper <- delta.upper / (delta.upper + dfb + dfw + 1)
  results <- cbind(Est=etasq,LL=etasq.lower,UL=etasq.upper)
  rownames(results) <- "Omnibus"
  return(results)
}

pvaOmnibus.wss <- function(DescStats,CorrStats,conf.level=.90) {
  temptab <- descOmnibus(DescStats,CorrStats)
  SSf <- temptab["Factor","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"] 
  dft <- dff + dfe
  F <- (SSf/dff)/(SSe/dfe)
  etasq <- SSf / SSt
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(ncpF(F,dff,dfe,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(ncpF(F,dff,dfe,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  etasq.lower <- delta.lower / (delta.lower + dff + dfe + 1)
  etasq.upper <- delta.upper / (delta.upper + dff + dfe + 1)
  results <- cbind(Est=etasq,LL=etasq.lower,UL=etasq.upper)
  rownames(results) <- "Omnibus"
  return(results)
}

pvaOmnibus.default <- function(...,mu=0,conf.level=.90,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)  
  results <- pvaOmnibus(DescStats,CorrStats)
  return(results)
}

pvaOmnibus.formula <- function(formula,mu=0,conf.level=.90,rope=NULL) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- pvaOmnibus(DescStats,conf.level)
  return(results)
}

effectOmnibus <- function(...,main=NULL,digits=3) {
  results <- formatList(list(pvaOmnibus(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For By the Omnibus Effect"} else {names(results) <- main}
  return(results)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Omnibus Functions

allOmnibus <- function(...) {
  output <- list(
  descOmnibus=descOmnibus(...),
  nhstOmnibus=nhstOmnibus(...),
  pvaOmnibus=pvaOmnibus(...))
  return(output)
}

analyzeOmnibus <- function(...,main=NULL,digits=3) {
  results <- formatList(allOmnibus(...),digits=digits)
  names(results) <- c("Analysis of Variance Source Table","Hypothesis Test for the Omnibus Effect","Proportion of Variance Accounted For By the Omnibus Effect")
  print(results)
}

