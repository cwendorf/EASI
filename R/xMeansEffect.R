# Estimation Approach to Statistical Inference
## Functions for Eta Squared

### Omnibus Effect Size

.ncpF <- function(x,df1,df2,prob,interval=c(0,10000),my.tol=0.000001) {
  temp <- function(ncp) pf(x,df1,df2,ncp) - prob
  return(uniroot(temp, interval, tol = my.tol)$root)
}

estimateMeansEffect <- estimateMeanEffect <- function(x,...) 
  UseMethod("estimateMeansEffect")

estimateMeansEffect.bss <- function(DescStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
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

estimateMeansEffect.wss <- function(DescStats,CorrStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[]])
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

estimateMeansEffect.default <- function(...,mu=0,conf.level=.90,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])  
  estimateMeansEffect(DescStats,CorrStats,main=main,digits=digits)
}

estimateMeansEffect.formula <- function(formula,mu=0,conf.level=.90,rope=NULL,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateMeansEffect(DescStats,conf.level,main=main,digits=digits)
}
