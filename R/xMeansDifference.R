# Estimation Approach to Statistical Inference
## Mean Differences

### Confidence Intervals

.estimateMeansDifference <- function(x, ...) {
  UseMethod(".estimateMeansDifference")
}

.estimateMeansDifference.wss <- function(CompStats, CorrStats, mu = 0, conf.level = .95, labels = NULL, ...) {
  CompStats <- CompStats[1:2, ]
  N <- CompStats[, "N"]
  M <- CompStats[, "M"]
  SD <- CompStats[, "SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1], rn[2]]
  MD <- M[2] - M[1] - mu
  SE <- SD / sqrt(N)
  SE <- sqrt(SE[1]^2 + SE[2]^2 - 2 * R * SE[1] * SE[2])
  df <- min(N) - 1
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- MD - tcrit * SE
  UL <- MD + tcrit * SE
  results <- data.frame(Diff = MD, SE = SE, df = df, LL = LL, UL = UL)
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateMeansDifference.bss <- function(CompStats, mu = 0, conf.level = .95, labels = NULL, ...) {
  CompStats <- CompStats[1:2, ]
  N <- CompStats[, "N"]
  M <- CompStats[, "M"]
  SD <- CompStats[, "SD"]
  MD <- M[2] - M[1] - mu
  SE <- sqrt((SD[1]^2 / N[1]) + (SD[2]^2 / N[2]))
  df <- ((SD[1]^2 / N[1] + SD[2]^2 / N[2])^2) / ((SD[1]^2 / N[1])^2 / (N[1] - 1) + (SD[2]^2 / N[2])^2 / (N[2] - 1))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- MD - tcrit * SE
  UL <- MD + tcrit * SE
  results <- data.frame(Diff = MD, SE = SE, df = df, LL = LL, UL = UL)
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.estimateMeansDifference.default <- function(frame, mu = 0, conf.level = .95, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  CompStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansDifference.wss(CompStats, CorrStats, conf.level = conf.level, labels = labels)
}

.estimateMeansDifference.formula <- function(formula, mu = 0, conf.level = .95, labels = NULL, ...) {
  CompStats <- .describeSummary(formula)
  .estimateMeansDifference.bss(CompStats, conf.level = conf.level, labels = labels)
}

estimateMeansDifference <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansDifference(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Difference of Means"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansDifference <- function(x, ...) {
  UseMethod(".testMeansDifference")
}

.testMeansDifference.wss <- function(CompStats, CorrStats, mu = 0, labels = NULL, ...) {
  CompStats <- CompStats[1:2, ]
  N <- CompStats[, "N"]
  M <- CompStats[, "M"]
  SD <- CompStats[, "SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1], rn[2]]
  MD <- M[2] - M[1] - mu
  SE <- SD / sqrt(N)
  SE <- sqrt(SE[1]^2 + SE[2]^2 - 2 * R * SE[1] * SE[2])
  df <- min(N) - 1
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- data.frame(Diff = MD, SE = SE, df = df, t = t, p = p)
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.testMeansDifference.bss <- function(CompStats, mu = 0, labels = NULL, ...) {
  CompStats <- CompStats[1:2, ]
  N <- CompStats[, "N"]
  M <- CompStats[, "M"]
  SD <- CompStats[, "SD"]
  MD <- M[2] - M[1] - mu
  SE <- sqrt((SD[1]^2 / N[1]) + (SD[2]^2 / N[2]))
  df <- ((SD[1]^2 / N[1] + SD[2]^2 / N[2])^2) / ((SD[1]^2 / N[1])^2 / (N[1] - 1) + (SD[2]^2 / N[2])^2 / (N[2] - 1))
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- data.frame(Diff = MD, SE = SE, df = df, t = t, p = p)
  if (is.null(labels)) {
    rownames(results) <- c("Comparison")
  } else {
    rownames(results) <- labels
  }
  return(results)
}

.testMeansDifference.default <- function(frame, mu = 0, labels = NULL, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  CompStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansDifference.wss(CompStats, CorrStats, mu = mu, labels = labels)
}

.testMeansDifference.formula <- function(formula, mu = 0, labels = NULL, ...) {
  CompStats <- .describeSummary(formula)
  .testMeansDifference.bss(CompStats, mu = mu, labels = labels)
}

testMeansDifference <- function(..., main = NULL, digits = 3) {
  results <- .testMeansDifference(...)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Difference of Means"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansDifference <- function(..., main = NULL, digits = 3, ylab = "Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansDifference(..., mu = mu, conf.level = conf.level, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

### Combined Analyses

analyzeMeansDifference <- function(..., main = NULL, digits = 3) {
  eMD <- estimateMeansDifference(..., digits = digits)
  tMD <- testMeansDifference(..., digits = digits)
  eSMD <- estimateStandardizedMeansDifference(..., digits = digits)
  results <- c(eMD, tMD, eSMD)
  return(results)
}