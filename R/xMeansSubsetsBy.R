# Estimation Approach to Statistical Inference
## Means Subsets By

### Confidence Intervals

.estimateMeansSubsetsBy <- function(x, ...) {
  UseMethod(".estimateMeansSubsetsBy")
}

.estimateMeansSubsetsBy.wss <- function(ListDescStats, ListCorrStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    temp <- .estimateMeansSubsets.wss(ListDescStats[[i]], ListCorrStats[[i]], contrast = contrast, conf.level = conf.level)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.estimateMeansSubsetsBy.bss <- function(ListDescStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    temp <- .estimateMeansSubsets.bss(ListDescStats[[i]], contrast = contrast, conf.level = conf.level)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.estimateMeansSubsetsBy.default <- function(frame, by, contrast, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansSubsetsBy.wss(ListDescStats, ListCorrStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

.estimateMeansSubsetsBy.formula <- function(formula, by, contrast, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansSubsetsBy.bss(ListDescStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

estimateMeansSubsetsBy <- function(..., contrast, conf.level = .95, main = NULL, digits = 3) {
  results <- .estimateMeansSubsetsBy(..., contrast = contrast, conf.level = conf.level)
  if (is.null(main)) {
    for (i in seq(1, length(results), 2)) {
      main <- c(main, "Confidence Intervals for Subsets of Means", "Confidence Interval for the Contrast of Means")
    }
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansSubsetsBy <- function(x, ...) {
  UseMethod(".testMeansSubsetsBy")
}

.testMeansSubsetsBy.wss <- function(ListDescStats, ListCorrStats, contrast, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "wss"
    temp <- .testMeansSubsets.wss(ListDescStats[[i]], ListCorrStats[[i]], contrast = contrast, mu = mu)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.testMeansSubsetsBy.bss <- function(ListDescStats, contrast, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    class(ListDescStats[[i]]) <- "bss"
    temp <- .testMeansSubsets.bss(ListDescStats[[i]], contrast = contrast, mu = mu)
    names(temp) <- c(names(ListDescStats[i]), names(ListDescStats[i]))
    results <- c(results, temp)
  }
  return(results)
}

.testMeansSubsetsBy.default <- function(frame, by, contrast, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansSubsetsBy.wss(ListDescStats, ListCorrStats, contrast = contrast, mu = mu)
  return(results)
}

.testMeansSubsetsBy.formula <- function(formula, by, contrast, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansSubsetsBy.bss(ListDescStats, contrast = contrast, mu = mu)
  return(results)
}

testMeansSubsetsBy <- function(..., contrast, mu = 0, main = NULL, digits = 3) {
  results <- .testMeansSubsetsBy(..., contrast = contrast, mu = mu)
  if (is.null(main)) {
    for (i in seq(1, length(results), 2)) {
      main <- c(main, "Hypothesis Tests for Subsets the Means", "Hypothesis Test for the Contrast of Means")
    }
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansSubsetsBy <- function(..., by, contrast, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsetsBy(..., by = by, contrast = contrast, conf.level = conf.level)
  for (i in seq(1, length(results), 2)) {
    temp <- results[i:(i+1)]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
