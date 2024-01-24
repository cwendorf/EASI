# Estimation Approach to Statistical Inference
## Means Comparison

### Estimate

estimateComparison <- estimateMeansComparison <- function(x, ...) {
  UseMethod("estimateMeansComparison")
}

estimateMeansComparison.bsm <- function(moments, conf.level = .95, mu = 0, ...) {
  Levels <- estimateMeansSet(moments, conf.level = conf.level, mu = 0, ...)
  Diff <- estimateMeansDifference(moments, conf.level = conf.level, mu = 0, ...)
  results <- rbind(Levels, Diff)
  comment(results) <- "Confidence Intervals for the Mean Comparison"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansComparison.wsm <- function(moments, corrs, conf.level = .95, mu = 0, ...) {
  Levels <- estimateMeansSet(moments, corrs, conf.level = conf.level, mu = 0, ...)
  Diff <- estimateMeansDifference(moments, corrs, conf.level = conf.level, mu = 0, ...)
  results <- rbind(Levels, Diff)
  comment(results) <- "Confidence Intervals for the Mean Comparison"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansComparison.data.frame <- function(frame, conf.level = .95, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansComparison(moments, corrs, conf.level = conf.level, mu = 0, labels = labels, ...)
}

estimateMeansComparison.formula <- function(formula, conf.level = .95, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  estimateMeansComparison(moments, conf.level = conf.level, mu = 0, labels = labels, ...)
}

estimateMeansComparison.bsml <- function(moments, ...) {
  iterate(moments, estimateMeansComparison, ...)
}

estimateMeansComparison.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, estimateMeansComparison, ...)
}

### Plot

plotComparison <- plotMeansComparison <- function(x, ...) {
  UseMethod("plotMeansComparison")
}

plotMeansComparison.wsm <- plotMeansComparison.wsml <- function(moments, corrs, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(moments, corrs, conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComparison.bsm <- plotMeansComparison.bsml <- function(moments, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(moments, conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComparison.data.frame <- function(frame, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = TRUE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(frame, conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansComparison.formula <- function(formula, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, ylim = NULL, digits = 3, connect = FALSE, pos = c(2, 2, 4), pch = c(16, 16, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansComparison(formula, conf.level = conf.level, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

addComparison <- addMeansComparison <- function(...) {
  plotMeansComparison(..., add = TRUE)
}

### Test

testComparison <- testMeansComparison <- function(x, ...) {
  UseMethod("testMeansComparison")
}

testMeansComparison.bsm <- function(moments, mu = 0, ...) {
  Levels <- testMeansSet(moments, mu = 0, ...)
  Diff <- testMeansDifference(moments, mu = 0, ...)
  results <- rbind(Levels, Diff)
  comment(results) <- "Hypothesis Tests for the Mean Comparison"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansComparison.wsm <- function(moments, corrs, mu = 0, ...) {
  Levels <- testMeansSet(moments, corrs, mu = 0, ...)
  Diff <- testMeansDifference(moments, corrs, mu = 0, ...)
  results <- rbind(Levels, Diff)
  comment(results) <- "Hypothesis Tests for the Mean Comparison"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansComparison.data.frame <- function(frame, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansComparison(moments, corrs, mu = 0, labels = labels, ...)
}

testMeansComparison.formula <- function(formula, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  testMeansComparison(moments, mu = 0, labels = labels, ...)
}

testMeansComparison.bsml <- function(moments, ...) {
  iterate(moments, testMeansComparison, ...)
}

testMeansComparison.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, testMeansComparison, ...)
}
