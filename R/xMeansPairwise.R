# Estimation Approach to Statistical Inference
## Pairwise Comparisons

### Confidence Intervals

.estimateMeansPairwise <- function(x, ...) {
  UseMethod(".estimateMeansPairwise")
}

.estimateMeansPairwise.wss <- function(DescStats, CorrStats, conf.level = .95, mu = 0, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  SE <- SD / sqrt(N)
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr) * (nr - 1) / 2
  results <- data.frame(matrix(ncol = 5, nrow = ncomp))
  colnames(results) <- c("Diff", "SE", "df", "LL", "UL")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      MD <- M[rn[j]] - M[rn[i]] - mu
      SEd <- sqrt(SE[rn[i]]^2 + SE[rn[j]]^2 - 2 * CorrStats[rn[i], rn[j]] * SE[rn[i]] * SE[rn[j]])
      df <- min(N) - 1
      tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
      LL <- MD - tcrit * SEd
      UL <- MD + tcrit * SEd
      results[comp, ] <- c(MD, SEd, df, LL, UL)
      comp <- comp + 1
    }
  }
  return(results)
}

.estimateMeansPairwise.bss <- function(DescStats, conf.level = .95, mu = 0, ...) {
  N <- t(combn(DescStats[, "N"], 2))
  M <- t(combn(DescStats[, "M"], 2))
  SD <- t(combn(DescStats[, "SD"], 2))
  MD <- M[, 2] - M[, 1] - mu
  SE <- sqrt((SD[, 1]^2 / N[, 1]) + (SD[, 2]^2 / N[, 2]))
  df <- ((SD[, 1]^2 / N[, 1] + SD[, 2]^2 / N[, 2])^2) / ((SD[, 1]^2 / N[, 1])^2 / (N[, 1] - 1) + (SD[, 2]^2 / N[, 2])^2 / (N[, 2] - 1))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- MD - tcrit * SE
  UL <- MD + tcrit * SE
  results <- cbind(MD, SE, df, LL, UL)
  rn <- t(combn(rownames(DescStats), 2))
  rownames(results) <- paste(rn[, 1], "v", rn[, 2])
  results
}

.estimateMeansPairwise.default <- function(frame, conf.level = .95, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansPairwise.wss(DescStats, CorrStats, conf.level = conf.level, mu = mu)
}

.estimateMeansPairwise.formula <- function(formula, conf.level = .95, mu = 0, ...) {
  DescStats <- .describeSummary(formula)
  .estimateMeansPairwise.bss(DescStats, conf.level = conf.level, mu = mu)
}

estimateMeansPairwise <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansPairwise(...)
  if (is.null(main)) {
    if (nrow(results) > 1) {
      main <- "Confidence Intervals for the Pairwise Comparisons of Means"
    } else {
      main <- "Confidence Interval for the Pairwise Comparison of Means"
    }
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansPairwise <- function(x, ...) {
  UseMethod(".testMeansPairwise")
}

.testMeansPairwise.wss <- function(DescStats, CorrStats, mu = 0, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  SE <- SD / sqrt(N)
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr) * (nr - 1) / 2
  results <- data.frame(matrix(ncol = 5, nrow = ncomp))
  colnames(results) <- c("Diff", "SE", "df", "t", "p")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      MD <- M[rn[j]] - M[rn[i]] - mu
      SEd <- sqrt(SE[rn[i]]^2 + SE[rn[j]]^2 - 2 * CorrStats[rn[i], rn[j]] * SE[rn[i]] * SE[rn[j]])
      df <- min(N) - 1
      t <- MD / SEd
      p <- 2 * (1 - pt(abs(t), df))
      results[comp, ] <- c(MD, SEd, df, t, p)
      comp <- comp + 1
    }
  }
  return(results)
}

.testMeansPairwise.bss <- function(DescStats, mu = 0, ...) {
  N <- t(combn(DescStats[, "N"], 2))
  M <- t(combn(DescStats[, "M"], 2))
  SD <- t(combn(DescStats[, "SD"], 2))
  MD <- M[, 2] - M[, 1] - mu
  SE <- sqrt((SD[, 1]^2 / N[, 1]) + (SD[, 2]^2 / N[, 2]))
  df <- ((SD[, 1]^2 / N[, 1] + SD[, 2]^2 / N[, 2])^2) / ((SD[, 1]^2 / N[, 1])^2 / (N[, 1] - 1) + (SD[, 2]^2 / N[, 2])^2 / (N[, 2] - 1))
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(MD, SE, df, t, p)
  rn <- t(combn(rownames(DescStats), 2))
  rownames(results) <- paste(rn[, 1], "v", rn[, 2])
  results
}

.testMeansPairwise.default <- function(frame, mu = 0, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeSummary(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansPairwise.wss(DescStats, CorrStats, mu = mu)
}

.testMeansPairwise.formula <- function(formula, mu = 0, ...) {
  DescStats <- .describeSummary(formula)
  .testMeansPairwise.bss(DescStats, mu = mu)
}

testMeansPairwise <- function(..., main = NULL, digits = 3) {
  results <- .testMeansPairwise(...)
  if (is.null(main)) {
    if (nrow(results) > 1) {
      main <- "Hypothesis Tests for the Pairwise Comparisons of Means"
    } else {
      main <- "Hypothesis Test for the Pairwise Comparison of Means"
    }
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotMeansPairwise <- function(..., main = NULL, digits = 3, ylab = "Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, ylim = NULL, add = FALSE, connect = FALSE, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansPairwise(..., conf.level = conf.level, mu = mu, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotMeansPairwiseDiffogram <- function(..., main = "Confidence Intervals for the Pairwise Comparisons of Means", ylab = "", xlab = "", conf.level = .95, ylim = NULL, pch = 17, col = "black") {
  dm <- .describeSummary(...)
  emp <- .estimateMeansPairwise(..., conf.level = conf.level)
  .intervalsDiffogram(dm = dm, emp = emp, main = main, ylab = ylab, xlab = xlab, ylim = ylim, pch = pch, col = col)
}

### Combined Analyses

analyzeMeansPairwise <- function(..., main = NULL, digits = 3) {
  eMP <- estimateMeansPairwise(..., digits = digits)
  tMP <- testMeansPairwise(..., digits = digits)
  eSMP <- estimateStandardizedMeansPairwise(..., digits = digits)
  results <- c(eMP, tMP, eSMP)
  return(results)
}
