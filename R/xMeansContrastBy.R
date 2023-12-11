# Estimation Approach to Statistical Inference
## Means Contrast By

### Confidence Intervals

.estimateMeansContrastBy <- function(x, ...) {
  UseMethod(".estimateMeansContrastBy")
}

.estimateMeansContrastBy.wss <- function(ListDescStats, ListCorrStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansContrast.wss(ListDescStats[[i]], ListCorrStats[[i]], contrast = contrast, conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansContrastBy.bss <- function(ListDescStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansContrast.bss(ListDescStats[[i]], contrast = contrast, conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansContrastBy.default <- function(frame, by, contrast, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansContrastBy.wss(ListDescStats, ListCorrStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

.estimateMeansContrastBy.formula <- function(formula, by, contrast, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansContrastBy.bss(ListDescStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

estimateMeansContrastBy <- function(..., contrast, conf.level = .95, main = NULL, digits = 3) {
  results <- .estimateMeansContrastBy(..., contrast = contrast, conf.level = conf.level)
  if (is.null(main)) {
    main <- "Confidence Interval for the Contrast of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansContrastBy <- function(x, ...) {
  UseMethod(".testMeansContrastBy")
}

.testMeansContrastBy.wss <- function(ListDescStats, ListCorrStats, contrast, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansContrast.wss(ListDescStats[[i]], ListCorrStats[[i]], contrast = contrast, mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansContrastBy.bss <- function(ListDescStats, contrast, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansContrast.bss(ListDescStats[[i]], contrast = contrast, mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansContrastBy.default <- function(frame, by, contrast, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansContrastBy.wss(ListDescStats, ListCorrStats, contrast = contrast, mu = mu)
  return(results)
}

.testMeansContrastBy.formula <- function(formula, by, contrast, mu = 0, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansContrastBy.bss(ListDescStats, contrast = contrast, mu = mu)
  return(results)
}

testMeansContrastBy <- function(..., contrast, mu = 0, main = NULL, digits = 3) {
  results <- .testMeansContrastBy(..., contrast = contrast, mu = mu)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Contrast of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansContrastBy <- function(..., by, contrast, main = NULL, ylab = "Outcome", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, ylim = NULL, add = FALSE, digits = 3, pos = 2, connect = FALSE, pch = 16, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrastBy(..., by = by, contrast = contrast, conf.level = conf.level)
  for (i in seq_along(results)) {
    temp <- results[i]
    plotIntervals(temp, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
    par(ask = TRUE)
  }
  par(ask = FALSE)
}
