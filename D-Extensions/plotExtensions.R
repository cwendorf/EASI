
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# EXTENDED FUNCTIONS FOR COMPARISONS AND CONTRASTS
# PLOTS OF CONFIDENCE INTERVALS

# Pairwise Plots

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

# Contrast Plots

plotContrasts <- function(...) 
  UseMethod("plotContrasts")

plotContrasts.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results <- easiContrasts(...)[,c(1,3,4)]
  cipLevels(results,main,ylab,xlab,mu) 
}

plotContrasts.formula <- function(formula,mu=NULL,...) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results <- easiContrasts(formula,...)[,c(1,3,4)]
  cipLevels(results,main,ylab,xlab,mu) 
}
