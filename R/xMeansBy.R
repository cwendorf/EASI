# Estimation Approach to Statistical Inference
## Means By

### Confidence Intervals

.estimateMeansBy <- function(x, ...) {
  UseMethod(".estimateMeansBy")
}

.estimateMeansBy.wss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeans.wss(ListDescStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- "wss"
  return(results)
}

.estimateMeansBy.bss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeans.wss(ListDescStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- "bss"
  return(results)
}

.estimateMeansBy.default <- function(frame, by, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  results <- .estimateMeansBy.wss(ListDescStats, conf.level = conf.level)
  return(results)
}

.estimateMeansBy.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansBy.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateMeansBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansBy(...)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansBy <- function(x, ...) {
  UseMethod(".testMeansBy")
}

.testMeansBy.wss <- .testMeansBy.bss <- function(ListDescStats, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeans.wss(ListDescStats[[i]], mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansBy.default <- function(frame, by, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  results <- .testMeansBy.wss(ListDescStats, mu = mu)
  return(results)
}

.testMeansBy.formula <- function(formula, by, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansBy.bss(ListDescStats, mu = mu)
  return(results)
}

testMeansBy <- function(..., main = NULL, digits = 3) {
  results <- .testMeansBy(...)
  if (is.null(main)) {
    main <- "Hypothesis Tests for the Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansBy <- function(x, ...) {
  UseMethod("plotMeansBy")
}

plotMeansBy.wss <- plotMeansBy.default <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = TRUE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansBy(..., by = by, conf.level = conf.level)
  for (i in seq_along(results)) {
    temp <- results[i]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}

plotMeansBy.bss <- plotMeansBy.formula <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansBy(..., by = by, conf.level = conf.level)
  for (i in seq_along(results)) {
    temp <- results[i]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
