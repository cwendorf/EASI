# Estimation Approach to Statistical Inference
## Means Complex

### Estimate

estimateComplex <- estimateMeansComplex <- function(x, ...) {
  UseMethod("estimateMeansComplex")
}

estimateMeansComplex.data.frame <- estimateMeansComplex.formula <- estimateMeansComplex.wsm <- estimateMeansComplex.bsm <- function(..., contrast1, contrast2, conf.level = .95, labels = NULL) {
  res1 <- estimateMeansContrast(..., contrast = contrast1, conf.level = conf.level)
  res2 <- estimateMeansContrast(..., contrast = contrast2, conf.level = conf.level)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  contrast <- contrast2 - contrast1
  Diff <- estimateMeansContrast(..., contrast = contrast, conf.level = conf.level)
  results <- rbind(Complex, Diff)
  comment(results) <- "Confidence Intervals for the Mean Contrasts"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansComplex.bsml <- function(moments, func, ...) {
  iterate(moments, estimateMeansComplex, ...)
}

estimateMeansComplex.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, estimateMeansComplex, ...)
}

### Plot

plotComplex <- plotMeansComplex <- function(x, ...) {
  UseMethod("plotMeansComplex")
}

plotMeansComplex.wsm <- plotMeansComplex.wsml <- plotMeansComplex.data.frame <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComplex.bsm <- plotMeansComplex.bsml <- plotMeansComplex.formula <- function(..., contrast1, contrast2, main = NULL, ylab = "Mean Contrasts", xlab = "", conf.level = .95, rope = NULL, add = FALSE, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComplex(..., contrast1 = contrast1, contrast2 = contrast2, conf.level = conf.level, labels = labels, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

### Test

testComplex <- testMeansComplex <- function(x, ...) {
  UseMethod("testMeansComplex")
}

testMeansComplex.data.frame <- testMeansComplex.formula <- testMeansComplex.wsm <- testMeansComplex.bsm <- function(..., contrast1, contrast2, labels = NULL) {
  res1 <- testMeansContrast(..., contrast = contrast1)
  res2 <- testMeansContrast(..., contrast = contrast2)
  Complex <- rbind(res1, res2)
  if (is.null(labels)) {
    rownames(Complex) <- c("Contrast1", "Contrast2")
  } else {
    rownames(Complex) <- labels
  }
  contrast <- contrast2 - contrast1
  Diff <- testMeansContrast(..., contrast = contrast)
  results <- rbind(Complex, Diff)
  comment(results) <- "Hypothesis Tests for the Mean Contrasts"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansComplex.bsml <- function(moments, func, ...) {
  iterate(moments, testMeansComplex, ...)
}

testMeansComplex.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, testMeansComplex, ...)
}
