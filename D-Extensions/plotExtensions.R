# Estimation Approach to Statistical Inference (EASI)
## Extended Functions for Comparisons and Contrasts

### Plots of Confidence Intervals

#### Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(...)[,c(1,4,5)]
  cipLevels(results,main,ylab,xlab,mu) 
}

plotPairwise.formula <- function(formula,conf.level=.95,mu=NA,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(formula,...)[,c(1,4,5)]
  cipLevels(results,main,ylab,xlab,mu) 
}
