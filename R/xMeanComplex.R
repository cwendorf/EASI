# Estimation Approach to Statistical Inference
## Mean Complex Contrasts

### Confidence Intervals

.estimateMeanComplex <- function(x, ...) {
  UseMethod(".estimateMeanComplex")
}

.estimateMeanComplex.default <- .estimateMeanComplex.formula <- .estimateMeanComplex.wss <- .estimateMeanComplex.bss <- function(..., contrast1, contrast2, conf.level = .95, labels = NULL) {
  res1 <- .estimateMeanContrast(..., contrast = contrast1, conf.level = conf.level)
  res2 <- .estimateMeanContrast(..., contrast = contrast2, conf.level = conf.level)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  Complex <- list(Complex)
  names(Complex) <- "Confidence Intervals for the Mean Contrasts"
  contrast <- contrast2 - contrast1
  Diff <- .estimateMeanContrast(..., contrast = contrast, conf.level = conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Mean Contrast"
  results <- c(Complex, Diff)
  return(results)
}

estimateMeanComplex <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeanComplex(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeanComplex <- function(x, ...) {
  UseMethod(".testMeanComplex")
}

.testMeanComplex.default <- .testMeanComplex.formula <- .testMeanComplex.wss <- .testMeanComplex.bss <- function(..., contrast1, contrast2, labels = NULL) {
  res1 <- .testMeanContrast(..., contrast = contrast1)
  res2 <- .testMeanContrast(..., contrast = contrast2)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  Complex <- list(Complex)
  names(Complex) <- "Hypthesis Tests for the Mean Contrasts"
  contrast <- contrast2 - contrast1
  Diff <- .testMeanContrast(..., contrast = contrast)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Test for the Mean Contrast"
  results <- c(Complex, Diff)
  return(results)
}

testMeanComplex <- function(..., main = NULL, digits = 3) {
  results <- .testMeanComplex(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeanComplex <- function(x, ...) {
  UseMethod("plotMeanComplex")
}

plotMeanComplex.wss <- plotMeanComplex.default <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeanComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Contrasts"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeanComplex.bss <- plotMeanComplex.formula <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeanComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Mean Contrasts"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
