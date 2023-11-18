# Estimation Approach to Statistical Inference
## Old Simplified Names

### Mean Difference

estimateDifference <- function(x, ...) {
  UseMethod("estimateMeanDifference")
}

testDifference <- function(x, ...) {
  UseMethod("testMeanDifference")
}

plotDifference <- function(x, ...) {
  UseMethod("plotMeanDifference")
}

### Mean Contrast

estimateContrast <- function(x, ...) {
  UseMethod("estimateMeanContrast")
}

testContrast <- function(x, ...) {
  UseMethod("testMeanContrast")
}

plotContrast <- function(x, ...) {
  UseMethod("plotMeanContrast")
}

### Mean Comparison

estimateComparison <- function(x, ...) {
  UseMethod("estimateMeanComparison")
}

testComparison <- function(x, ...) {
  UseMethod("testMeanComparison")
}

plotComparison <- function(x, ...) {
  UseMethod("plotMeanComparison")
}

### Mean Subsets

estimateSubsets <- function(x, ...) {
  UseMethod("estimateMeanSubsets")
}

testSubsets <- function(x, ...) {
  UseMethod("testMeanSubsets")
}

plotSubsets <- function(x, ...) {
  UseMethod("plotMeanSubsets")
}

### Means Pairwise

estimatePaiwise <- function(x, ...) {
  UseMethod("estimateMeansPairwise")
}

testPairwise <- function(x, ...) {
  UseMethod("testMeansPairwise")
}

plotPairwise <- function(x, ...) {
  UseMethod("plotMeansPairwise")
}

### Means Posthoc

estimatePosthoc <- function(x, ...) {
  UseMethod("estimateMeansPosthoc")
}

testPosthoc <- function(x, ...) {
  UseMethod("testMeansPosthoc")
}

plotPosthoc <- function(x, ...) {
  UseMethod("plotMeansPosthoc")
}

### Mean Effect

describeEffect <- function(x, ...) {
  UseMethod("describeMeansEffect")
}

estimateEffect <- function(x, ...) {
  UseMethod("estimateMeansEffect")
}

testEffect <- function(x, ...) {
  UseMethod("testMeansEffect")
}

### Mean Factorial

describeFactorial <- function(x, ...) {
  UseMethod("describeMeansFactorial")
}

estimateFactorial <- function(x, ...) {
  UseMethod("estimateMeansFactorial")
}

testFactorial <- function(x, ...) {
  UseMethod("testMeansFactorial")
}

plotFactorial <- function(x, ...) {
  UseMethod("plotMeansFactorial")
}

### Mean Interaction

estimateInteraction <- function(x, ...) {
  UseMethod("estimateMeanInteraction")
}

testInteraction <- function(x, ...) {
  UseMethod("testMeanInteraction")
}

plotInteraction <- function(x, ...) {
  UseMethod("plotMeanInteraction")
}

### Regression Coefficients

estimateCoefficients <- function(x, ...) {
  UseMethod("estimateRegressionCoefficients")
}

testCoefficients <- function(x, ...) {
  UseMethod("testRegressionCoefficients")
}

plotCoefficients <- function(x, ...) {
  UseMethod("plotRegressionCoefficients")
}

### Regression Model

describeModel <- function(x, ...) {
  UseMethod("describeRegressionEffect")
}

estimateModel <- function(x, ...) {
  UseMethod("estimateRegressionEffect")
}

testModel <- function(x, ...) {
  UseMethod("testRegressionEffect")
}

plotModel <- function(x, ...) {
  UseMethod("plotRegressionEffect")
}

