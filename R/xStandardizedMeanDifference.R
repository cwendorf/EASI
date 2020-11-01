# Estimation Approach to Statistical Inference
## Functions for Standardized Mean Differences

### Confidence Interval Functions

estimateStandardizedMeansDifference <- estimateStandardizedMeanDifference <- function(x,...) 
  UseMethod("estimateStandardizedMeanDifference")

estimateStandardizedMeanDifference.wss <- function(DescStats,CorrStats,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- DescStats[1:2,]
  N <- min(CompStats[1:2,"N"])
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Standardized Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

estimateStandardizedMeanDifference.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  CompStats <- DescStats[1:2,]
  N <- CompStats[1:2,"N"]
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  if(is.null(main)) {main="Confidence Interval for the Standardized Mean Difference"}
  results <- .formatList(list(results),digits=digits)  
  names(results) <- main
  return(results)
}

estimateStandardizedMeanDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3) {
  CompStats <- .unformatFrame(describeMeans(...)[[1]])
  class(CompStats) <- "wss"
  CorrStats <- .unformatFrame(describeCorrelations(...)[[1]])
  estimateStandardizedMeanDifference(CompStats,CorrStats,conf.level=conf.level,main=main,digits=digits)
}

estimateStandardizedMeanDifference.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,main=NULL,digits=3,...) {
  DescStats <- .unformatFrame(describeMeans(formula)[[1]])
  class(DescStats) <- "bss"
  estimateStandardizedMeanDifference(DescStats,contrast,conf.level=conf.level,main=main,digits=digits)
}