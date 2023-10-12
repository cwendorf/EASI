# Estimation Approach to Statistical Inference
## Regression Coefficients

### Confidence Intervals

.estimateRegressionCoefficients <- function(x, ...)
  UseMethod(".estimateRegressionCoefficients")

.estimateRegressionCoefficients.wss <- function(DescStats, CorrStats, y = NULL, conf.level = .95, ...) {
  if (!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    DescStats <- DescStats[rn, ]
    class(DescStats) <- "wss"}
  rn <- rownames(DescStats)
  CorrStats <- CorrStats[rn, rn]
  M <- DescStats[, "M"]
  V <- .cortocov(CorrStats, DescStats[, "SD"])
  N <- DescStats[1, "N"]
  k <- nrow(DescStats) - 1
  M <- M * N
  V <- V * (N - 1)
  V <- V + outer(M, M) / N
  V <- rbind(c(N, M), cbind(M, V))
  XX <- V[-(k + 2), -(k + 2)]
  XY <- V[-(k + 2), k + 2]
  YY <- V[k + 2, k + 2]
  b <- solve(XX, XY)
  df <- N - k - 1
  s2 <- (YY - b %*% XY) / df
  SE <- sqrt(diag(solve(XX) * c(s2)))
  alpha.lower <- alpha.upper <- (1 - conf.level) / 2
  LL <- b + qt(alpha.lower, df) * SE
  UL <- b + qt(1 - alpha.upper, df) * SE
  results <- cbind(Est = b, SE = SE, LL = LL, UL = UL)
  rownames(results)[1] <- "(Intercept)"
  return(results)
}

.estimateRegressionCoefficients.default <- function(frame, y = NULL, conf.level = .95, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn  ==  deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]}
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .estimateRegressionCoefficients.wss(DescStats, CorrStats, conf.level = conf.level)
}


estimateRegressionCoefficients <- function(..., main = NULL, digits = 3) {
  results <- .estimateRegressionCoefficients(...)
  if (is.null(main)) {main <- "Confidence Intervals for the Regression Coefficients"}
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testRegressionCoefficients <- function(x, ...)
  UseMethod(".testRegressionCoefficients")

.testRegressionCoefficients.wss <- function(DescStats, CorrStats, y = NULL, ...) {
  if (!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    DescStats <- DescStats[rn, ]
    class(DescStats) <- "wss"}
  rn <- rownames(DescStats)
  CorrStats <- CorrStats[rn, rn]
  M <- DescStats[, "M"]
  V <- .cortocov(CorrStats, DescStats[, "SD"])
  N <- DescStats[1, "N"]
  k <- nrow(DescStats) - 1
  M <- M * N
  V <- V * (N - 1)
  V <- V + outer(M, M) / N
  V <- rbind(c(N, M), cbind(M, V))
  XX <- V[-(k + 2), -(k + 2)]
  XY <- V[-(k + 2), k + 2]
  YY <- V[k + 2, k + 2]
  b <- solve(XX, XY)
  df <- N - k - 1
  s2 <- (YY - b %*% XY) / df
  SE <- sqrt(diag(solve(XX) * c(s2)))
  t <- b / SE
  p <- 2 * pt(abs(t), df, lower.tail = FALSE)
  results <- cbind(Est = b, SE = SE, t = t, p = p)
  rownames(results)[1] = "(Intercept)"
  return(results)
}

.testRegressionCoefficients.default <- function(frame, y = NULL, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn  ==  deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]}
  DescStats <- .describeMeans.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .testRegressionCoefficients.wss(DescStats, CorrStats)
}

testRegressionCoefficients <- function(..., main = NULL, digits = 3) {
  results <- .testRegressionCoefficients(...)
  if (is.null(main)) {main <- "Hypothesis Tests for the Regression Coefficients"}
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotRegressionCoefficients <- function(..., intercept = TRUE, main = NULL, digits = 3, ylab = "Regression Coefficient", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 15, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateRegressionCoefficients(..., conf.level = conf.level, main = main, digits = digits)
  if (intercept == "FALSE") {results[[1]] <- tail(results[[1]], -1)}
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
