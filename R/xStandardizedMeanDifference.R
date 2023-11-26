# Estimation Approach to Statistical Inference
## Standardized Mean Differences

### Confidence Intervals

.estimateStandardizedMeanDifference <- function(x, ...) {
  UseMethod(".estimateStandardizedMeanDifference")
}

.estimateStandardizedMeanDifference.wss <- function(DescStats, CorrStats, conf.level = .95, labels = NULL, ...) {
  CompStats <- DescStats[1:2, ]
  N <- min(CompStats[1:2, "N"])
  M <- CompStats[1:2, "M"]
  SD <- CompStats[1:2, "SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1], rn[2]]
  z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2) / 2)
  df <- N - 1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1 + v2 - 2 * R * SD[1] * SD[2]
  Est <- (M[2] - M[1]) / s
  SE <- sqrt(Est^2 * (v1^2 + v2^2 + 2 * R^2 * v1 * v2) / (8 * df * s^4) + vd / (df * s^2))
  LL <- Est - z * SE
  UL <- Est + z * SE
  results <- as.data.frame(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("d", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateStandardizedMeanDifference.bss <- function(DescStats, contrast, conf.level = .95, labels = NULL, ...) {
  CompStats <- DescStats[1:2, ]
  N <- CompStats[1:2, "N"]
  M <- CompStats[1:2, "M"]
  SD <- CompStats[1:2, "SD"]
  z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1 + v2) / 2)
  Est <- (M[2] - M[1]) / s
  SE <- sqrt(Est^2 * (v1^2 / (N[1] - 1) + v2^2 / (N[2] - 1)) / (8 * s^4) + (v1 / (N[1] - 1) + v2 / (N[2] - 1)) / s^2)
  LL <- Est - z * SE
  UL <- Est + z * SE
  results <- as.data.frame(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("d", "SE", "LL", "UL")
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateStandardizedMeanDifference.default <- function(frame, conf.level = .95, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  CompStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .estimateStandardizedMeanDifference.wss(CompStats, CorrStats, conf.level = conf.level, labels = labels)
}

.estimateStandardizedMeanDifference.formula <- function(formula, contrast, conf.level = .95, labels = NULL, ...) {
  DescStats <- .describeSummary(formula)
  .estimateStandardizedMeanDifference.bss(DescStats, contrast, conf.level = conf.level, labels = labels)
}

estimateStandardizedMeanDifference <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeanDifference(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Standardized Difference of Means"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeanDifference <- function(..., main = NULL, digits = 3, ylab = "Standardized Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 24, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateStandardizedMeanDifference(..., mu = mu, conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
