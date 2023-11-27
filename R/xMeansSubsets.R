# Estimation Approach to Statistical Inference
## Mean Subsets

### Confidence Interval Functions

.estimateMeansSubsets <- function(x, ...) {
  UseMethod(".estimateMeansSubsets")
}

.estimateMeansSubsets.default <- .estimateMeansSubsets.formula <- .estimateMeansSubsets.wss <- .estimateMeansSubsets.bss <- function(..., contrast, conf.level = .95, labels = NULL) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- .estimateMeanContrast(..., contrast = con1, conf.level = conf.level)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- .estimateMeanContrast(..., contrast = con2, conf.level = conf.level)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Subsets <- list(Subsets)
  names(Subsets) <- "Confidence Intervals for the Subsets of Means"
  Diff <- .estimateMeanContrast(..., contrast = contrast, conf.level = conf.level)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Contrast of Means"
  results <- c(Subsets, Diff)
  return(results)
}

estimateMeansSubsets <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansSubsets(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansSubsets <- function(x, ...) {
  UseMethod(".testMeansSubsets")
}

.testMeansSubsets.default <- .testMeansSubsets.formula <- .testMeansSubsets.wss <- .testMeansSubsets.bss <- function(..., contrast, labels = NULL) {
  con1 <- ifelse(contrast < 0, 0, contrast)
  res1 <- .testMeanContrast(..., contrast = con1)
  con2 <- ifelse(contrast > 0, 0, abs(contrast))
  res2 <- .testMeanContrast(..., contrast = con2)
  Subsets <- rbind(res2, res1)
  if (is.null(labels)) {
    rownames(Subsets) <- c("Neg Weighted", "Pos Weighted")
  } else {
    rownames(Subsets) <- labels
  }
  Subsets <- list(Subsets)
  names(Subsets) <- "Hypothesis Tests for the Subsets of Means"
  Diff <- .testMeanContrast(..., contrast = contrast)
  Diff <- list(Diff)
  names(Diff) <- "Hypothesis Tests for the Contrast of Means"
  results <- c(Subsets, Diff)
  return(results)
}

testMeansSubsets <- function(..., main = NULL, digits = 3) {
  results <- .testMeansSubsets(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansSubsets <- function(x, ...) {
  UseMethod("plotMeansSubsets")
}

plotMeansSubsets.wss <- plotMeansSubsets.default <- function(..., contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(..., contrast = contrast, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Subsets of Means"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansSubsets.bss <- plotMeansSubsets.formula <- function(..., contrast, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = c(15, 15, 17), col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansSubsets(..., contrast = contrast, conf.level = conf.level, labels = labels, main = main, digits = digits)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Subsets of Means"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
