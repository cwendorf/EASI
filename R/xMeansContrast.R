# Estimation Approach to Statistical Inference
## Means Contrast

### Estimate

estimateContrast <- estimateMeansContrast <- function(x, ...) {
  UseMethod("estimateMeansContrast")
}

estimateMeansContrast.wsm <- function(moments, corrs, contrast, conf.level = .95, ...) {
  N <- min(moments[, "N"])
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  df <- N - 1
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  covstats <- .cortocov(corrs, SD)
  Est <- (t(contrast) %*% M)
  SE <- sqrt(t(contrast) %*% covstats %*% contrast / N)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- cbind(t(c(Est, SE, df, LL, UL)))
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  rownames(results) <- c("Contrast")
  comment(results) <- "Confidence Interval for the Mean Contrast"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansContrast.bsm <- function(moments, contrast, conf.level = .95, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  Est <- t(contrast) %*% M
  v <- diag(SD^2) %*% (solve(diag(N)))
  SE <- sqrt(t(contrast) %*% v %*% contrast)
  df <- (SE^4) / sum(((contrast^4) * (SD^4) / (N^2 * (N - 1))))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- cbind(t(c(Est, SE, df, LL, UL)))
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  rownames(results) <- c("Contrast")
  comment(results) <- "Confidence Interval for the Mean Contrast"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansContrast.data.frame <- function(frame, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansContrast(moments, corrs, contrast, conf.level = conf.level, labels = labels, ...)
}

estimateMeansContrast.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(formula)
  estimateMeansContrast(moments, contrast, conf.level = conf.level, labels = labels, ...)
}

estimateMeansContrast.bsml <- function(moments, func, ...) {
  iterate(moments, estimateMeansContrast, ...)
}

estimateMeansContrast.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, estimateMeansContrast, ...)
}

### Plot

plotContrast <- plotMeansContrast <- function(x, ...) {
  UseMethod("plotMeansContrast")
}

plotMeansContrast.bsm <- plotMeansContrast.bsml <- function(moments, contrast, add = FALSE, main = NULL, ylab = "Mean Contrast", xlab = "", conf.level = .95, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrast(moments, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansContrast.wsm <- plotMeansContrast.wsml <- function(moments, corrs, contrast, add = FALSE, main = NULL, ylab = "Mean Contrast", xlab = "", conf.level = .95, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrast(moments, corrs, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansContrast.formula <- function(formula, contrast, add = FALSE, main = NULL, ylab = "Mean Contrast", xlab = "", conf.level = .95, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrast(formula, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, cowsmnnect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansContrast.data.frame <- function(frame, contrast, add = FALSE, main = NULL, ylab = "Mean Contrast", xlab = "", conf.level = .95, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrast(frame, contrast = contrast, conf.level = conf.level, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

addContrast <- addMeansContrast <- function(...) {
  plotMeansContrast(..., add = TRUE)
}

### Test

testContrast <- testMeansContrast <- function(x, ...) {
  UseMethod("testMeansContrast")
}

testMeansContrast.bsm <- function(moments, contrast, mu = 0, labels = NULL, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  Est <- (t(contrast) %*% M) - mu
  v <- diag(SD^2) %*% (solve(diag(N)))
  SE <- sqrt(t(contrast) %*% v %*% contrast)
  df <- (SE^4) / sum(((contrast^4) * (SD^4) / (N^2 * (N - 1))))
  t <- Est / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(t(c(Est, SE, df, t, p)))
  colnames(results) <- c("Est", "SE", "df", "t", "p")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  comment(results) <- "Hypothesis Test for the Mean Contrast"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansContrast.wsm <- function(moments, corrs, contrast, mu = 0, labels = NULL, ...) {
  N <- min(moments[, "N"])
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  Est <- (t(contrast) %*% M) - mu
  covstats <- .cortocov(corrs, SD)
  SE <- sqrt(t(contrast) %*% covstats %*% contrast / N)
  t <- Est / SE
  df <- N - 1
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(t(c(Est, SE, df, t, p)))
  colnames(results) <- c("Est", "SE", "df", "t", "p")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  comment(results) <- "Hypothesis Test for the Mean Contrast"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansContrast.data.frame <- function(frame, contrast, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansContrast(moments, corrs, contrast, mu = mu, labels = labels, ...)
}

testMeansContrast.formula <- function(formula, contrast, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  testMeansContrast(moments, contrast, mu = mu, labels = labels, ...)
}

testMeansContrast.bsml <- function(moments, func, ...) {
  iterate(moments, testMeansContrast, ...)
}

testMeansContrast.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, testMeansContrast, ...)
}

### Standardize

standardizeContrast <- standardizeMeansContrast <- function(x, ...) {
  UseMethod("standardizeMeansContrast")
}

standardizeMeansContrast.wsm <- function(moments, corrs, contrast, conf.level = .95, labels = NULL, ...) {
  N <- min(moments[, "N"])
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  R <- mean(corrs[upper.tri(corrs)])
  df <- N - 1
  z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
  a <- length(M)
  s <- sqrt(sum(SD^2) / a)
  Est <- (t(contrast) %*% M) / s
  v1 <- Est^2 / (2 * a^2 * s^4 * df)
  v2 <- sum(SD^4)
  v3 <- R^2 * t(SD^2) %*% SD^2
  v4 <- sum(contrast^2 * SD^2)
  v5 <- R * t(contrast * SD) %*% (contrast * SD)
  SE <- sqrt(v1 * (v2 + v3) + (v4 - v5) / (df * s^2))
  LL <- Est - z * SE
  UL <- Est + z * SE
  results <- cbind(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("Est", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  comment(results) <- "Confidence Interval for the Standardized Mean Contrast"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansContrast.bsm <- function(moments, contrast, conf.level = .95, labels = NULL, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
  v <- SD^2
  a <- length(M)
  s <- sqrt(sum(v) / a)
  Est <- (t(contrast) %*% M) / s
  a1 <- Est^2 / (a^2 * s^4)
  a2 <- a1 * sum((v^2 / (2 * (N - 1))))
  a3 <- sum((contrast^2 * v / (N - 1))) / s^2
  SE <- sqrt(a2 + a3)
  LL <- Est - z * SE
  UL <- Est + z * SE
  results <- cbind(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("Est", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  comment(results) <- "Confidence Interval for the Standardized Mean Contrast"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansContrast.data.frame <- function(frame, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  standardizeMeansContrast(moments, corrs, contrast, conf.level = conf.level, labels = labels)
}

standardizeMeansContrast.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(formula)
  standardizeMeansContrast(moments, contrast, conf.level = conf.level, labels = labels)
}

standardizeMeansContrast.bsml <- function(moments, func, ...) {
  iterate(moments, standardizeMeansContrast, ...)
}

standardizeMeansContrast.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, standardizeMeansContrast, ...)
}
