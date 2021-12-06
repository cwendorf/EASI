# Estimation Approach to Statistical Inference
## Eta Squared

### Descriptives

.describeMeansEffect <- function(x,...) 
  UseMethod(".describeMeansEffect")

.describeMeansEffect.wss <- function(DescStats,CorrStats) {
  temptab <- .describeMeansOmnibus.wss(DescStats,CorrStats)
  SSf <- temptab["Measures","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Measures","df"]
  dfe <- temptab["Error","df"] 
  dft <- dff + dfe
  F <- (SSf/dff)/(SSe/dfe)
  etasq <- SSf / SSt
  results <- cbind(Est=etasq)
  rownames(results) <- "Measures"
  return(results)
}

.describeMeansEffect.bss <- function(DescStats) {
  temptab <- .describeMeansOmnibus.bss(DescStats)
  SSb <- temptab["Between","SS"]
  SSw <- temptab["Within","SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between","df"]
  dfw <- temptab["Within","df"] 
  dft <- dfb + dfw
  F <- (SSb/dfb)/(SSw/dfw) 
  etasq <- SSb / SSt
  results <- cbind(Est=etasq)
  rownames(results) <- "Factor"
  return(results)
}

.describeMeansEffect.default <- function(...) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .describeMeansEffect.wss(DescStats,CorrStats)
}

.describeMeansEffect.formula <- function(formula) {
  DescStats <- .describeMeans(formula)
  .describeMeansEffect.bss(DescStats)
}

describeMeansEffect <- function(...,main=NULL,digits=3) {
  results <- .describeMeansEffect(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"} 
  results <- .formatList(list(results),main-main,digits=digits)  
  return(results)
}

### Confidence Intervals

.estimateMeansEffect <- function(x,...) 
  UseMethod(".estimateMeansEffect")

.estimateMeansEffect.wss <- function(DescStats,CorrStats,conf.level=.90) {
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

.estimateMeansEffect.bss <- function(DescStats,conf.level=.90) {
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

.estimateMeansEffect.default <- function(...,conf.level=.90) {
  DescStats <- .describeMeans(...)
  CorrStats <- .describeCorrelations(...)
  .estimateMeansEffect.wss(DescStats,CorrStats,conf.level)
}

.estimateMeansEffect.formula <- function(formula,conf.level=.90) {
  DescStats <- .describeMeans(formula)
  .estimateMeansEffect.bss(DescStats,conf.level)
}

estimateMeansEffect <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansEffect(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"} 
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}
