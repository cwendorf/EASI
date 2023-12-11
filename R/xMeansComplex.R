# Estimation Approach to Statistical Inference
## Means Complex

### Confidence Intervals

.estimateMeansComplex <- function(x, ...) {
  UseMethod(".estimateMeansComplex")
}

.estimateMeansComplex.default <- .estimateMeansComplex.formula <- .estimateMeansComplex.wss <- .estimateMeansComplex.bss <- function(..., contrast1, contrast2, conf.level = .95, labels = NULL) {
  res1 <- .estimateMeansContrast(..., contrast = contrast1, conf.level = conf.level)
  res2 <- .estimateMeansContrast(..., contrast = contrast2, conf.level = conf.level)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  Complex <- list(Complex)
  names(Complex) <- "Confidence Intervals for the Contrasts of Means"
  contrast <- contrast2 - contrast1
  Diff <- .estimateMeansContrast(..., contrast = contrast, conf.level = conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Contrast of Contrasts"
  results <- c(Complex, Diff)
  return(results)
}

estimateMeansComplex <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansComplex(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansComplex <- function(x, ...) {
  UseMethod(".testMeansComplex")
}

.testMeansComplex.default <- .testMeansComplex.formula <- .testMeansComplex.wss <- .testMeansComplex.bss <- function(..., contrast1, contrast2, labels = NULL) {
  res1 <- .testMeansContrast(..., contrast = contrast1)
  res2 <- .testMeansContrast(..., contrast = contrast2)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  Complex <- list(Complex)
  names(Complex) <- "Hypthesis Tests for the Contrasts of Means"
  contrast <- contrast2 - contrast1
  Diff <- .testMeansContrast(..., contrast = contrast)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Test for the Contrast of Contrasts"
  results <- c(Complex, Diff)
  return(results)
}

testMeansComplex <- function(..., main = NULL, digits = 3) {
  results <- .testMeansComplex(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansComplex <- function(x, ...) {
  UseMethod("plotMeansComplex")
}

plotMeansComplex.wss <- plotMeansComplex.default <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Contrast of Contrasts"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComplex.bss <- plotMeansComplex.formula <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Contrast of Contrasts"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
