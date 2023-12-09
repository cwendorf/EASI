# Estimation Approach to Statistical Inference
## Means Comparisons

### Confidence Intervals

.estimateMeansComparison <- function(x, ...) {
  UseMethod(".estimateMeansComparison")
}

.estimateMeansComparison.default <- .estimateMeansComparison.formula <- .estimateMeansComparison.wss <- .estimateMeansComparison.bss <- function(..., conf.level = .95, mu = 0) {
  Levels <- .estimateMeans(..., conf.level = conf.level, mu = 0)
  Levels <- Levels[1:2, ]
  Levels <- list(Levels)
  names(Levels) <- "Confidence Intervals for the Means"
  Diff <- .estimateMeansDifference(..., conf.level = conf.level, mu = 0)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Difference of Means"
  results <- c(Levels, Diff)
  return(results)
}

estimateMeansComparison <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansComparison(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansComparison <- function(x, ...) {
  UseMethod(".testMeansComparison")
}

.testMeansComparison.default <- .testMeansComparison.formula <- .testMeansComparison.wss <- .testMeansComparison.bss <- function(..., mu = 0) {
  Levels <- .testMeans(..., mu = 0)
  Levels <- Levels[1:2, ]
  Levels <- list(Levels)
  names(Levels) <- "Hypothesis Tests for the Means"
  Diff <- .testMeansDifference(..., mu = mu)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Test for the Difference of Means"
  results <- c(Levels, Diff)
  return(results)
}

testMeansComparison <- function(..., main = NULL, digits = 3) {
  results <- .testMeansComparison(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansComparison <- function(x, ...) {
  UseMethod("plotMeansComparison")
}

plotMeansComparison.wss <- plotMeansComparison.default <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Comparison of Means"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComparison.bss <- plotMeansComparison.formula <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Comparison of Means"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}