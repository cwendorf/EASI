# Estimation Approach to Statistical Inference
## Means Contrast

### Confidence Intervals

.estimateMeansContrast <- function(x, ...) {
  UseMethod(".estimateMeansContrast")
}

.estimateMeansContrast.wss <- function(DescStats, CorrStats, contrast, conf.level = .95, labels = NULL, ...) {
  N <- min(DescStats[, "N"])
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  df <- N - 1
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  covstats <- .cortocov(CorrStats, SD)
  Est <- (t(contrast) %*% M)
  SE <- sqrt(t(contrast) %*% covstats %*% contrast / N)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- as.data.frame(t(c(Est, SE, df, LL, UL)))
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateMeansContrast.bss <- function(DescStats, contrast, conf.level = .95, labels = NULL, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  Est <- t(contrast) %*% M
  v <- diag(SD^2) %*% (solve(diag(N)))
  SE <- sqrt(t(contrast) %*% v %*% contrast)
  df <- (SE^4) / sum(((contrast^4) * (SD^4) / (N^2 * (N - 1))))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- as.data.frame(t(c(Est, SE, df, LL, UL)))
  colnames(results) <- c("Est", "SE", "df", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateMeansContrast.default <- function(frame, contrast, conf.level = .95, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansContrast.wss(DescStats, CorrStats, contrast, conf.level = conf.level, labels = labels)
}

.estimateMeansContrast.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  DescStats <- .describeSummary(formula)
  .estimateMeansContrast.bss(DescStats, contrast, conf.level = conf.level, labels = labels)
}

estimateMeansContrast <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansContrast(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Contrast of Means"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansContrast <- function(x, ...) {
  UseMethod(".testMeansContrast")
}

.testMeansContrast.bss <- function(DescStats, contrast, mu = 0, labels = NULL, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  Est <- (t(contrast) %*% M) - mu
  v <- diag(SD^2) %*% (solve(diag(N)))
  SE <- sqrt(t(contrast) %*% v %*% contrast)
  df <- (SE^4) / sum(((contrast^4) * (SD^4) / (N^2 * (N - 1))))
  t <- Est / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- as.data.frame(t(c(Est, SE, df, t, p)))
  colnames(results) <- c("Est", "SE", "df", "t", "p")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.testMeansContrast.wss <- function(DescStats, CorrStats, contrast, mu = 0, labels = NULL, ...) {
  N <- min(DescStats[, "N"])
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  Est <- (t(contrast) %*% M) - mu
  covstats <- .cortocov(CorrStats, SD)
  SE <- sqrt(t(contrast) %*% covstats %*% contrast / N)
  t <- Est / SE
  df <- N - 1
  p <- 2 * (1 - pt(abs(t), df))
  results <- as.data.frame(t(c(Est, SE, df, t, p)))
  colnames(results) <- c("Est", "SE", "df", "t", "p")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.testMeansContrast.default <- function(frame, contrast, mu = 0, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansContrast.wss(DescStats, CorrStats, contrast, mu = mu, labels = labels)
}

.testMeansContrast.formula <- function(formula, contrast, mu = 0, labels = NULL, ...) {
  DescStats <- .describeSummary(formula)
  .testMeansContrast.bss(DescStats, contrast, mu = mu, labels = labels)
}

testMeansContrast <- function(..., main = NULL, digits = 3) {
  results <- .testMeansContrast(...)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Contrast of Means"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansContrast <- function(..., main = NULL, digits = 3, ylab = "Mean Contrast", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, connect = FALSE, values = TRUE, pos = 2, ylim = NULL, add = FALSE, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansContrast(..., conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

### Combined Analyses

analyzeMeansContrast <- function(..., main = NULL, digits = 3) {
  eMC <- estimateMeansContrast(..., digits = digits)
  tMC <- testMeansContrast(..., digits = digits)
  eSMC <- estimateStandardizedMeansContrast(..., digits = digits)
  results <- c(eMC, tMC, eSMC)
  return(results)
}
