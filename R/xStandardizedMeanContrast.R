# Estimation Approach to Statistical Inference
##  Standardized Mean Contrasts

### Confidence Intervals

.estimateStandardizedMeanContrast <- function(x, ...) {
  UseMethod(".estimateStandardizedMeanContrast")
}

.estimateStandardizedMeanContrast.wss <- function(DescStats, CorrStats, contrast, conf.level = .95, labels = NULL, ...) {
  N <- min(DescStats[, "N"])
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  R <- mean(CorrStats[upper.tri(CorrStats)])
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
  results <- as.data.frame(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("Est", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateStandardizedMeanContrast.bss <- function(DescStats, contrast, conf.level = .95, labels = NULL, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
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
  results <- as.data.frame(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("Est", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Contrast")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateStandardizedMeanContrast.default <- function(frame, contrast, conf.level = .95, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .estimateStandardizedMeanContrast.wss(DescStats, CorrStats, contrast, conf.level = conf.level, labels = labels)
}

.estimateStandardizedMeanContrast.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  DescStats <- .describeSummary(formula)
  .estimateStandardizedMeanContrast.bss(DescStats, contrast, conf.level = conf.level, labels = labels)
}

estimateStandardizedMeanContrast <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeanContrast(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Standardized Mean Contrast"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanContrast <- function(..., main = NULL, digits = 3, ylab = "Standardized Mean Contrast", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, connect = FALSE, values = TRUE, pos = 2, ylim = NULL, add = FALSE, pch = 24, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateStandardizedMeanContrast(..., conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
