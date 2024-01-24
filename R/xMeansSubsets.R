# Estimation Approach to Statistical Inference
## Means Subsets

### Estimate

estimateSubsets <- estimateMeansSubsets <- function(x, ...) {
  UseMethod("estimateMeansSubsets")
}

estimateMeansSubsets.wsm <- function(moments, corrs, contrast, conf.level = .95, labels = NULL, ...) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- estimateMeansContrast(moments, corrs, contrast = con1, conf.level = conf.level)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- estimateMeansContrast(moments, corrs, contrast = con2, conf.level = conf.level)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Diff <- estimateMeansContrast(moments, corrs, contrast = contrast, conf.level = conf.level)
  results <- rbind(Subsets, Diff)
  comment(results) <- "Confidence Intervals for the Mean Subsets"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansSubsets.bsm <- function(moments, contrast, conf.level = .95, labels = NULL, ...) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- estimateMeansContrast(moments, contrast = con1, conf.level = conf.level)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- estimateMeansContrast(moments, contrast = con2, conf.level = conf.level)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Diff <- estimateMeansContrast(moments, contrast = contrast, conf.level = conf.level)
  results <- rbind(Subsets, Diff)
  comment(results) <- "Confidence Intervals for the Mean Subsets"
  class(results) <- c("easi.frame", "intervals.comp")
  return(results)
}

estimateMeansSubsets.data.frame <- function(frame, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansSubsets(moments, corrs, contrast, conf.level = conf.level, labels = labels, ...)
}

estimateMeansSubsets.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(formula)
  estimateMeansSubsets(moments, contrast, conf.level = conf.level, labels = labels, ...)
}

estimateMeansSubsets.bsml <- function(moments, func, ...) {
  iterate(moments, estimateMeansSubsets, ...)
}

estimateMeansSubsets.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, estimateMeansSubsets, ...)
}

### Plot

plotSubsets <- plotMeansSubsets <- function(x, ...) {
  UseMethod("plotMeansSubsets")
}

plotMeansSubsets.bsm <- plotMeansSubsets.bsml <- function(moments, contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(moments, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansSubsets.wsm <- plotMeansSubsets.wsml <- function(moments, corrs, contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(moments, corrs, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansSubsets.formula <- function(formula, contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(formula, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansSubsets.data.frame <- function(frame, contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(frame, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

addSubsets <- addMeansSubsets <- function(...) {
  plotMeansSubsets(..., add = TRUE)
}

### Test

testSubsets <- testMeansSubsets <- function(x, ...) {
  UseMethod("testMeansSubsets")
}

testMeansSubsets.wsm <- function(moments, corrs, contrast, mu = 0, labels = NULL, ...) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- estimateMeansContrast(moments, corrs, contrast = con1, mu = mu)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- estimateMeansContrast(moments, corrs, contrast = con2, mu = mu)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Diff <- testMeansContrast(moments, corrs, contrast = contrast, mu = mu)
  results <- rbind(Subsets, Diff)
  comment(results) <- "Hypothesis Tests for the Means Subsets"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansSubsets.bsm <- function(moments, contrast, mu = 0, labels = NULL, ...) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- estimateMeansContrast(moments, contrast = con1, mu = mu)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- estimateMeansContrast(moments, contrast = con2, mu = mu)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Diff <- estimateMeansContrast(moments, contrast = contrast, mu = mu)
  results <- rbind(Subsets, Diff)
  comment(results) <- "Hypothesis Tests for the Means Subsets"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansSubsets.data.frame <- function(frame, contrast, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansSubsets(moments, corrs, contrast, mu = mu, labels = labels, ...)
}

testMeansSubsets.formula <- function(formula, contrast, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  testMeansSubsets(moments, contrast, mu = mu, labels = labels, ...)
}

testMeansSubsets.bsml <- function(moments, func, ...) {
  iterate(moments, testMeansSubsets, ...)
}

testMeansSubsets.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, testMeansSubsets, ...)
}
