# Estimation Approach to Statistical Inference
## Standardized Regression Coefficients

### Confidence Intervals

.estimateStandardizedRegressionCoefficients <- function(x, ...) {
  UseMethod(".estimateStandardizedRegressionCoefficients")
}

.estimateStandardizedRegressionCoefficients.wss <- function(DescStats, CorrStats, y = NULL, conf.level = .95, ...) {
  if (!is.null(y)) {
    rn <- rownames(DescStats)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    DescStats <- DescStats[rn, ]
    class(DescStats) <- "wss"
  }
  temptab <- .estimateRegressionCoefficients.wss(DescStats, CorrStats, conf.level = conf.level)
  std <- DescStats[, "SD"] / DescStats[nrow(DescStats), "SD"]
  results <- data.frame(temptab * std)[-1, ]
  return(results)
}

.estimateStandardizedRegressionCoefficients.default <- function(frame, y = NULL, conf.level = .95, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  DescStats <- .describeSummary.default(frame)
  rownames(DescStats) <- colnames(frame)
  CorrStats <- .describeCorrelations(frame)
  .estimateStandardizedRegressionCoefficients.wss(DescStats, CorrStats, conf.level = conf.level)
}

estimateStandardizedRegressionCoefficients <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedRegressionCoefficients(...)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Standardized Regression Coefficients"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotStandardizedRegressionCoefficients <- function(..., main = NULL, digits = 3, ylab = "Standardized Regression Coefficient", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 22, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateStandardizedRegressionCoefficients(..., conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
}
