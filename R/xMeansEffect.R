# Estimation Approach to Statistical Inference
## Functions for Eta Squared


### Descriptive Functions

describeMeansEffect <- describeMeanEffect <- function(x,...) 
  UseMethod("describeMeansEffect")

describeMeansEffect.bss <- function(DescStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,main=main,digits=digits)[[1]])
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
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For by the Factor"} else {names(results) <- main}  
  return(results)
}

describeMeansEffect.wss <- function(DescStats,CorrStats,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
  SSf <- temptab["Factor","SS"]
  SSe <- temptab["Error","SS"]
  SSt <- SSf + SSe
  dff <- temptab["Factor","df"]
  dfe <- temptab["Error","df"] 
  dft <- dff + dfe
  F <- (SSf/dff)/(SSe/dfe)
  etasq <- SSf / SSt
  results <- cbind(Est=etasq)
  rownames(results) <- "Factor"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For by the Factor"} else {names(results) <- main}  
  return(results)
}

describeMeansEffect.default <- function(...,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(...)[[1]])
  class(DescStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])  
  describeMeansEffect(DescStats,CorrStats,main=main,digits=digits)
}

describeMeansEffect.formula <- function(formula,main=NULL,digits=3) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  describeMeansEffect(DescStats,main=main,digits=digits)
}

### Confidence Interval Functions

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
  rownames(results) <- "Factor"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For by the Factor"} else {names(results) <- main}  
  return(results)
}

estimateMeansEffect.wss <- function(DescStats,CorrStats,conf.level=.90,main=NULL,digits=3) {
  temptab <- .unformatFrame(describeMeansOmnibus(DescStats,CorrStats,main=main,digits=digits)[[1]])
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
  rownames(results) <- "Factor"
  results <- .formatList(list(results),digits=digits) 
  if(is.null(main)) {names(results) <- "Proportion of Variance Accounted For by the Factor"} else {names(results) <- main}  
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
