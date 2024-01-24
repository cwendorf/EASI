# Estimation Approach to Statistical Inference
## Regression Coefficients

### Estimate

estimateCoefficients <- estimateRegressionCoefficients <- function(x, ...) {
  UseMethod("estimateRegressionCoefficients")
}

estimateRegressionCoefficients.wsm <- function(moments, corrs, y = NULL, conf.level = .95, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
  }
  rn <- rownames(moments)
  corrs <- corrs[rn, rn]
  M <- moments[, "M"]
  V <- .cortocov(corrs, moments[, "SD"])
  N <- moments[1, "N"]
  k <- nrow(moments) - 1
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
  comment(results) <- "Confidence Intervals for the Regression Coefficients"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateRegressionCoefficients.data.frame <- function(frame, y = NULL, conf.level = .95, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  estimateRegressionCoefficients(moments, corrs, conf.level = conf.level)
}

### Plot

plotCoefficients <- plotRegressionCoefficients <- function(..., intercept = TRUE, main = NULL, digits = 3, ylab = "Regression Coefficient", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 15, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateRegressionCoefficients(..., conf.level = conf.level, main = main, digits = digits)
  main <- comment(results)
  if (intercept == "FALSE") {
    results <- tail(results, -1)
    class(results) <- c("easi.frame", "intervals.main")
  }
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

### Test

testCoefficients <- testRegressionCoefficients <- function(x, ...) {
  UseMethod("testRegressionCoefficients")
}

testRegressionCoefficients.wsm <- function(moments, corrs, y = NULL, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
  }
  rn <- rownames(moments)
  corrs <- corrs[rn, rn]
  M <- moments[, "M"]
  V <- .cortocov(corrs, moments[, "SD"])
  N <- moments[1, "N"]
  k <- nrow(moments) - 1
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
  rownames(results)[1] <- "(Intercept)"
  comment(results) <- "Hypothesis Tests for the Regression Coefficients"
  class(results) <- "easi.frame"
  return(results)
}

testRegressionCoefficients.data.frame <- function(frame, y = NULL, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  testRegressionCoefficients(moments, corrs)
}

### Standardize

standardizeCoefficients <- standardizeRegressionCoefficients <- function(x, ...) {
  UseMethod("standardizeRegressionCoefficients")
}

standardizeRegressionCoefficients.wsm <- function(moments, corrs, y = NULL, conf.level = .95, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
  }
  temptab <- estimateRegressionCoefficients.wsm(moments, corrs, conf.level = conf.level)
  std <- moments[, "SD"] / moments[nrow(moments), "SD"]
  results <- data.frame(temptab * std)[-1, ]
  comment(results) <- "Confidence Intervals for the Standardized Regression Coefficients"
  class(results) <- "easi.frame"
  return(results)
}

standardizeRegressionCoefficients.data.frame <- function(frame, y = NULL, conf.level = .95, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  standardizeRegressionCoefficients(moments, corrs, conf.level = conf.level)
}
