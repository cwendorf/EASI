# Estimation Approach to Statistical Inference
## Means

### Confidence Intervals

.estimateMeans <- function(x, ...) {
  UseMethod(".estimateMeans")
}

.estimateMeans.wss <- .estimateMeans.bss <- function(DescStats, mu = 0, conf.level = .95, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  Diff <- M - mu
  df <- N - 1
  SE <- SD / sqrt(N)
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- Diff - tcrit * SE
  UL <- Diff + tcrit * SE
  results <- data.frame(Diff = Diff, SE = SE, df = df, LL = LL, UL = UL)
  if (mu == 0) colnames(results)[1] <- "M"
  rownames(results) <- rownames(DescStats)
  return(results)
}

.estimateMeans.default <- function(frame, mu = 0, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans.default(data)
  .estimateMeans.wss(DescStats, conf.level = conf.level, mu = mu)
}

.estimateMeans.formula <- function(formula, mu = 0, conf.level = .95, ...) {
  DescStats <- .describeMeans.formula(formula)
  .estimateMeans.bss(DescStats, conf.level = conf.level, mu = mu)
}

estimateMeans <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeans(...)
  if (is.null(main)) {
    if (nrow(results) > 1) {
      main <- "Confidence Intervals for the Means"
    } else {
      main <- "Confidence Interval for the Mean"
    }
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeans <- function(x, ...) {
  UseMethod(".testMeans")
}

.testMeans.wss <- .testMeans.bss <- function(DescStats, mu = 0, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SE <- DescStats[, "SD"] / sqrt(N)
  Diff <- M - mu
  t <- Diff / SE
  df <- N - 1
  p <- 2 * (1 - pt(abs(t), df))
  results <- data.frame(Diff = Diff, SE = SE, df = df, t = t, p = p)
  rownames(results) <- rownames(DescStats)
  return(results)
}

.testMeans.default <- function(frame, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans.default(data)
  .testMeans.wss(DescStats, mu = mu, main = main, digits = digits)
}

.testMeans.formula <- function(formula, mu = 0, ...) {
  DescStats <- .describeMeans.formula(formula, ...)
  .testMeans.bss(DescStats, mu = mu, main = main, digits = digits)
}

testMeans <- function(..., main = NULL, digits = 3) {
  results <- .testMeans(...)
  if (is.null(main)) {
    if (nrow(results) > 1) {
      main <- "Hypothesis Tests for the Means"
    } else {
      main <- "Hypothesis Test for the Mean"
    }
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeans <- function(x, ...) {
  UseMethod("plotMeans")
}

plotMeans.wss <- plotMeans.default <- function(..., mu = 0, conf.level = .95, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, line = NULL, rope = NULL, values = TRUE, digits = 3, pos = 2, pch = 16, col = "black", connect = TRUE, offset = 0, intervals = TRUE) {
  results <- estimateMeans(..., mu = mu, conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
  invisible(eval(...))
}

plotMeans.bss <- plotMeans.formula <- function(..., mu = 0, conf.level = .95, add = FALSE, main = NULL, ylab = "Outcome", xlab = "", ylim = NULL, line = NULL, rope = NULL, values = TRUE, digits = 3, pos = 2, pch = 16, col = "black", connect = FALSE, offset = 0, intervals = TRUE) {
  results <- estimateMeans(..., mu = mu, conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
  invisible(eval(...))
}

addMeans <- function(...) {
  plotMeans(..., add = TRUE)
}

### Combined Analyses

analyzeMeans <- function(..., main = NULL, digits = 3) {
  eM <- estimateMeans(..., digits = digits)
  tM <- testMeans(..., digits = digits)
  eSM <- estimateStandardizedMeans(..., digits = digits)
  results <- c(eM, tM, eSM)
  return(results)
}
