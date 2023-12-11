# Estimation Approach to Statistical Inference
## Means Difference By

### Confidence Intervals

.estimateMeansDifferenceBy <- function(x, ...) {
  UseMethod(".estimateMeansDifferenceBy")
}

.estimateMeansDifferenceBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansDifference.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansDifferenceBy.bss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansDifference.bss(ListDescStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansDifferenceBy.default <- function(frame, by, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansDifferenceBy.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
  return(results)
}

.estimateMeansDifferenceBy.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansDifferenceBy.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateMeansDifferenceBy <- function(..., conf.level = .95, main = NULL, digits = 3) {
  results <- .estimateMeansDifferenceBy(..., conf.level = conf.level)
  if (is.null(main)) {
    main <- "Confidence Interval for the Difference of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansDifferenceBy <- function(x, ...) {
  UseMethod(".testMeansDifferenceBy")
}

.testMeansDifferenceBy.wss <- function(ListDescStats, ListCorrStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansDifference.wss(ListDescStats[[i]], ListCorrStats[[i]], mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansDifferenceBy.bss <- function(ListDescStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansDifference.bss(ListDescStats[[i]], mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansDifferenceBy.default <- function(frame, by, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansDifferenceBy.wss(ListDescStats, ListCorrStats, mu = mu)
  return(results)
}

.testMeansDifferenceBy.formula <- function(formula, by, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansDifferenceBy.bss(ListDescStats, mu = mu)
  return(results)
}

testMeansDifferenceBy <- function(..., mu = 0, main = NULL, digits = 3) {
  results <- .testMeansDifferenceBy(..., mu = mu)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Difference of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansDifferenceBy <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansDifferenceBy(..., by = by, conf.level = conf.level)
  for (i in seq_along(results)) {
    temp <- results[i]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
