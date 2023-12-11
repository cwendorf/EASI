# Estimation Approach to Statistical Inference
## Means Comparison By

### Confidence Intervals

.estimateMeansComparisonBy <- function(x, ...) {
  UseMethod(".estimateMeansComparisonBy")
}

.estimateMeansComparisonBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    temp <- .estimateMeansComparison.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level = conf.level)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.estimateMeansComparisonBy.bss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    temp <- .estimateMeansComparison.bss(ListDescStats[[i]], conf.level = conf.level)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.estimateMeansComparisonBy.default <- function(frame, by, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansComparisonBy.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
  return(results)
}

.estimateMeansComparisonBy.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansComparisonBy.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateMeansComparisonBy <- function(..., conf.level = .95, main = NULL, digits = 3) {
  results <- .estimateMeansComparisonBy(..., conf.level = conf.level)
  if (is.null(main)) {
    for (i in seq(1, length(results), 2)) {
      main <- c(main, "Confidence Intervals for the Means", "Confidence Interval for the Difference of Means")
    }
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansComparisonBy <- function(x, ...) {
  UseMethod(".testMeansComparisonBy")
}

.testMeansComparisonBy.wss <- function(ListDescStats, ListCorrStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    temp <- .testMeansComparison.wss(ListDescStats[[i]], ListCorrStats[[i]], mu = mu)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.testMeansComparisonBy.bss <- function(ListDescStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    temp <- .testMeansComparison.bss(ListDescStats[[i]], mu = mu)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.testMeansComparisonBy.default <- function(frame, by, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansComparisonBy.wss(ListDescStats, ListCorrStats, mu = mu)
  return(results)
}

.testMeansComparisonBy.formula <- function(formula, by, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansComparisonBy.bss(ListDescStats, mu = mu)
  return(results)
}

testMeansComparisonBy <- function(..., mu = 0, main = NULL, digits = 3) {
  results <- .testMeansComparisonBy(..., mu = mu)
  if (is.null(main)) {
    for (i in seq(1, length(results), 2)) {
      main <- c(main, "Hypothesis Tests for the Means", "Hypothesis Test for the Difference of Means")
    }
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansComparisonBy <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparisonBy(..., by = by, conf.level = conf.level)
  for (i in seq(1, length(results), 2)) {
    temp <- results[i:(i + 1)]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
