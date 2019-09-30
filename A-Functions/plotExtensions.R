# Estimation Approach to Statistical Inference (EASI)
## Extended Functions for Comparisons and Contrasts

### Plots of Confidence Intervals

#### Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- plotPairwise.bss <- plotPairwise.wss <- function(...,mu=NULL,rope=NULL) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- ciPairwise(...)[,c(1,4,5)]
  cipMeans(results,main,ylab,xlab,mu,rope) 
}

plotPairwise.formula <- function(formula,conf.level=.95,mu=NA,rope=NULL,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- ciPairwise(formula,...)[,c(1,4,5)]
  cipMeans(results,main,ylab,xlab,mu,rope) 
}
