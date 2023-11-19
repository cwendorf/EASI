# Estimation Approach to Statistical Inference
## Mean Difference (with By Option)

### Confidence Intervals

.estimateMeanDifferenceBy <- function(x, ...) {
  UseMethod(".estimateMeanDifferenceBy")
}

.estimateMeanDifferenceBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeanDifference.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeanDifferenceBy.bss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeanDifference.bss(ListDescStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeanDifferenceBy.default <- function(frame, by, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeanDifferenceBy.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
  return(results)
}

.estimateMeanDifferenceBy.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeanDifferenceBy.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateMeanDifferenceBy <- function(..., conf.level = .95, main = NULL, digits = 3) {
  results <- .estimateMeanDifferenceBy(..., conf.level = conf.level)
  if (is.null(main)) {
    main <- "Confidence Interval for the Mean Difference"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanDifferenceBy <- function(x, ...) {
  UseMethod(".testMeanDifferenceBy")
}

.testMeanDifferenceBy.wss <- function(ListDescStats, ListCorrStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeanDifference.wss(ListDescStats[[i]], ListCorrStats[[i]], mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeanDifferenceBy.bss <- function(ListDescStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeanDifference.bss(ListDescStats[[i]], mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeanDifferenceBy.default <- function(frame, by, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeanDifferenceBy.wss(ListDescStats, ListCorrStats, mu = mu)
  return(results)
}

.testMeanDifferenceBy.formula <- function(formula, by, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeanDifferenceBy.bss(ListDescStats, mu = mu)
  return(results)
}

testMeanDifferenceBy <- function(..., mu = 0, main = NULL, digits = 3) {
  results <- .testMeanDifferenceBy(..., mu = mu)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Mean Difference"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeanDifferenceBy <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeanDifferenceBy(..., by = by, conf.level = conf.level)
  for (i in 1:nlevels(by)) {
    temp <- results[i]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
