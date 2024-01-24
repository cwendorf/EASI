# Estimation Approach to Statistical Inference
## Means Difference

### Estimate

estimateDifference <- estimateMeansDifference <- function(x, ...) {
  UseMethod("estimateMeansDifference")
}

estimateMeansDifference.wsm <- function(moments, corrs, conf.level = .95, mu = 0,...) {
  moments <- moments[1:2,]
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  rn <- rownames(moments)
  R <- corrs[rn[1], rn[2]]
  Est <- M[2] - M[1] - mu
  SE <- SD / sqrt(N)
  SE <- sqrt(SE[1]^2 + SE[2]^2 - 2 * R * SE[1] * SE[2])
  df <- min(N) - 1
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- cbind(Est, SE, df, LL, UL)
  rownames(results) <- "Comparison"
  comment(results) <- "Confidence Interval for the Mean Difference"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansDifference.bsm <- function(moments, conf.level = .95, mu = 0, ...) {
  moments <- moments[1:2,]
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  Est <- M[2] - M[1] - mu
  SE <- sqrt((SD[1]^2 / N[1]) + (SD[2]^2 / N[2]))
  df <- ((SD[1]^2 / N[1] + SD[2]^2 / N[2])^2) / ((SD[1]^2 / N[1])^2 / (N[1] - 1) + (SD[2]^2 / N[2])^2 / (N[2] - 1))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- Est - tcrit * SE
  UL <- Est + tcrit * SE
  results <- cbind(Est, SE, df, LL, UL)
  rownames(results) <- "Comparison"
  comment(results) <- "Confidence Interval for the Mean Difference"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansDifference.data.frame <- function(frame, conf.level = .95, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansDifference(moments, corrs, conf.level = conf.level, mu = mu, labels = labels)
}

estimateMeansDifference.formula <- function(formula, conf.level = .95, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  estimateMeansDifference(moments, conf.level = conf.level, mu = mu, labels = labels)
}

estimateMeansDifference.bsml <- function(moments, func, ...) {
  iterate(moments, estimateMeansDifference, ...)
}

estimateMeansDifference.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, estimateMeansDifference, ...)
}

### Plot

plotDifference <- plotMeansDifference <- function(x, ...) {
  UseMethod("plotMeansDifference")
}

plotMeansDifference.bsm <- plotMeansDifference.bsml <- function(moments, add = FALSE, main = NULL, ylab = "Mean Difference", xlab = "", conf.level = .95, mu = 0, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateMeansDifference(moments, conf.level = conf.level, mu = mu, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansDifference.wsm <- plotMeansDifference.wsml <- function(moments, corrs, add = FALSE, main = NULL, ylab = "Mean Difference", xlab = "", conf.level = .95, mu = 0, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateMeansDifference(moments, corrs, conf.level = conf.level, mu = mu, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansDifference.formula <- function(formula, add = FALSE, main = NULL, ylab = "Mean Difference", xlab = "", conf.level = .95, mu = 0, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = FALSE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateMeansDifference(formula, conf.level = conf.level, mu = mu, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansDifference.data.frame <- function(frame, add = FALSE, main = NULL, ylab = "Mean Difference", xlab = "", conf.level = .95, mu = 0, line = NULL, rope = NULL, labels = NULL, values = TRUE, pos = c(2, 2, 4), connect = TRUE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateMeansDifference(frame, conf.level = conf.level, mu = mu, labels = labels)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

addDifference <- addMeansDifference <- function(...) {
  plotMeansDifference(..., add = TRUE)
}

### Test

testDifference <- testMeansDifference <- function(x, ...) {
  UseMethod("testMeansDifference")
}

testMeansDifference.wsm <- function(moments, corrs, mu = 0, labels = NULL, ...) {
  moments <- moments[1:2, ]
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  rn <- rownames(moments)
  R <- corrs[rn[1], rn[2]]
  MD <- M[2] - M[1] - mu
  SE <- SD / sqrt(N)
  SE <- sqrt(SE[1]^2 + SE[2]^2 - 2 * R * SE[1] * SE[2])
  df <- min(N) - 1
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(Diff = MD, SE = SE, df = df, t = t, p = p)
  rownames(results) <- "Comparison"
  comment(results) <- "Hypothesis Test for the Mean Difference"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansDifference.bsm <- function(moments, mu = 0, labels = NULL, ...) {
  moments <- moments[1:2, ]
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  MD <- M[2] - M[1] - mu
  SE <- sqrt((SD[1]^2 / N[1]) + (SD[2]^2 / N[2]))
  df <- ((SD[1]^2 / N[1] + SD[2]^2 / N[2])^2) / ((SD[1]^2 / N[1])^2 / (N[1] - 1) + (SD[2]^2 / N[2])^2 / (N[2] - 1))
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(Diff = MD, SE = SE, df = df, t = t, p = p)
  rownames(results) <- "Comparison"
  comment(results) <- "Hypothesis Test for the Mean Difference"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansDifference.data.frame <- function(frame, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansDifference(moments, corrs, conf.level = conf.level, mu = mu, labels = labels)
}

testMeansDifference.formula <- function(formula, mu = 0, labels = NULL, ...) {
  moments <- describeMoments(formula)
  testMeansDifference(moments,conf.level = conf.level, mu = mu, labels = labels)
}

testMeansDifference.bsml <- function(moments, func, ...) {
  iterate(moments, testMeansDifference, ...)
}

testMeansDifference.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, testMeansDifference, ...)
}

### Standardize

standardizeDifference <- standardizeMeansDifference <- function(x, ...) {
  UseMethod("standardizeMeansDifference")
}

standardizeMeansDifference.wsm <- function(moments, corrs, conf.level = .95, labels = NULL, ...) {
  moments <- moments[1:2, ]
  N <- min(moments[1:2, "N"])
  M <- moments[1:2, "M"]
  SD <- moments[1:2, "SD"]
  rn <- rownames(moments)
  R <- corrs[rn[1], rn[2]]
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
  results <- cbind(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("d", "SE", "LL", "UL")
  rownames(results) <- "Comparison"
  comment(results) <- "Confidence Interval for the Standardized Mean Difference"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansDifference.bsm <- function(moments, conf.level = .95, labels = NULL, ...) {
  moments <- moments[1:2, ]
  N <- moments[1:2, "N"]
  M <- moments[1:2, "M"]
  SD <- moments[1:2, "SD"]
  z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1 + v2) / 2)
  Est <- (M[2] - M[1]) / s
  SE <- sqrt(Est^2 * (v1^2 / (N[1] - 1) + v2^2 / (N[2] - 1)) / (8 * s^4) + (v1 / (N[1] - 1) + v2 / (N[2] - 1)) / s^2)
  LL <- Est - z * SE
  UL <- Est + z * SE
  results <- cbind(t(c(Est, SE, LL, UL)))
  colnames(results) <- c("d", "SE", "LL", "UL")
  rownames(results) <- "Comparison"
  comment(results) <- "Confidence Interval for the Standardized Mean Difference"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansDifference.data.frame <- function(frame, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  standardizeMeansDifference.wsm(moments, corrs, conf.level = conf.level, labels = labels)
}

standardizeMeansDifference.formula <- function(formula, conf.level = .95, labels = NULL, ...) {
  moments <- describeMoments(formula)
  standardizeMeansDifference(moments, conf.level = conf.level, labels = labels)
}

standardizeMeansDifference.bsml <- function(moments, func, ...) {
  iterate(moments, standardizeMeansDifference, ...)
}

standardizeMeansDifference.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, standardizeMeansDifference, ...)
}
