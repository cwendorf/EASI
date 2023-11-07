# Estimation Approach to Statistical Inference
## Mean Comparisons

### Confidence Intervals

.estimateMeanComparison <- function(x, ...) {
  UseMethod(".estimateMeanComparison")
}

.estimateMeanComparison.default <- .estimateMeanComparison.formula <- .estimateMeanComparison.wss <- .estimateMeanComparison.bss <- function(..., conf.level = .95, mu = 0) {
  Levels <- .estimateMeans(..., conf.level = conf.level, mu = 0)
  Levels <- Levels[1:2, ]
  Levels <- list(Levels)
  names(Levels) <- "Confidence Intervals for the Means"
  Diff <- .estimateMeanDifference(..., conf.level = conf.level, mu = 0)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Mean Difference"
  results <- c(Levels, Diff)
  return(results)
}

estimateMeanComparison <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeanComparison(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanComparison <- function(x, ...) {
  UseMethod(".testMeanComparison")
}

.testMeanComparison.default <- .testMeanComparison.formula <- .testMeanComparison.wss <- .testMeanComparison.bss <- function(..., mu = 0) {
  Levels <- .testMeans(..., mu = 0)
  Levels <- Levels[1:2, ]
  Levels <- list(Levels)
  names(Levels) <- "Hypothesis Tests for the Means"
  Diff <- .testMeanDifference(..., mu = mu)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Test for the Mean Difference"
  results <- c(Levels, Diff)
  return(results)
}

testMeanComparison <- function(..., main = NULL, digits = 3) {
  results <- .testMeanComparison(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeanComparison <- function(x, ...) {
  UseMethod("plotMeanComparison")
}

plotMeanComparison.wss <- plotMeanComparison.default <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeanComparison(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Comparison"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeanComparison.bss <- plotMeanComparison.formula <- function(..., add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeanComparison(..., conf.level = conf.level, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Comparison"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
