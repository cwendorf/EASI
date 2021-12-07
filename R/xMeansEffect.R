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
  results <- .ciEta2(F=F,dff=dff,dfe=dfe,etasq=etasq,conf.level=conf.level)
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
  results <- .ciEta2(F=F,dff=dfb,dfe=dfw,etasq=etasq,conf.level=conf.level)
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
