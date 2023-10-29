# Estimation Approach to Statistical Inference
## Pairwise Standardized Mean Comparisons

### Confidence Intervals

.estimateStandardizedMeansPairwise <- function(x, ...) {
  UseMethod(".estimateStandardizedMeansPairwise")
}

.estimateStandardizedMeansPairwise.wss <- function(DescStats, CorrStats, conf.level = .95, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr) * (nr - 1) / 2
  results <- data.frame(matrix(ncol = 4, nrow = ncomp))
  colnames(results) <- c("d", "SE", "LL", "UL")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      R <- CorrStats[rn[1], rn[2]]
      ns <- N[rn[c(i, j)]]
      mns <- M[rn[c(i, j)]]
      sds <- SD[rn[c(i, j)]]
      z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
      s <- sqrt((sds[1]^2 + sds[2]^2) / 2)
      df <- min(ns - 1)
      v1 <- sds[1]^2
      v2 <- sds[2]^2
      vd <- v1 + v2 - 2 * R * sds[1] * sds[2]
      Est <- (mns[2] - mns[1]) / s
      SE <- sqrt(Est^2 * (v1^2 + v2^2 + 2 * R^2 * v1 * v2) / (8 * df * s^4) + vd / (df * s^2))
      LL <- Est - z * SE
      UL <- Est + z * SE
      results[comp, ] <- c(Est, SE, LL, UL)
      comp <- comp + 1
    }
  }
  return(results)
}

.estimateStandardizedMeansPairwise.bss <- function(DescStats, conf.level = .95, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
  rn <- rownames(DescStats)
  nr <- nrow(DescStats)
  ncomp <- (nr) * (nr - 1) / 2
  results <- data.frame(matrix(ncol = 4, nrow = ncomp))
  colnames(results) <- c("d", "SE", "LL", "UL")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      ns <- N[rn[c(i, j)]]
      mns <- M[rn[c(i, j)]]
      sds <- SD[rn[c(i, j)]]
      z <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
      v1 <- sds[1]^2
      v2 <- sds[2]^2
      s <- sqrt((v1 + v2) / 2)
      Est <- (mns[2] - mns[1]) / s
      SE <- sqrt(Est^2 * (v1^2 / (N[1] - 1) + v2^2 / (N[2] - 1)) / (8 * s^4) + (v1 / (N[1] - 1) + v2 / (N[2] - 1)) / s^2)
      LL <- Est - z * SE
      UL <- Est + z * SE
      results[comp, ] <- c(Est, SE, LL, UL)
      comp <- comp + 1
    }
  }
  return(results)
}

.estimateStandardizedMeansPairwise.default <- function(frame, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateStandardizedMeansPairwise.wss(DescStats, CorrStats, conf.level = conf.level)
}

.estimateStandardizedMeansPairwise.formula <- function(formula, conf.level = .95, ...) {
  DescStats <- .describeMeans(formula)
  .estimateStandardizedMeansPairwise.bss(DescStats, conf.level = conf.level)
}

estimateStandardizedMeansPairwise <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeansPairwise(...)
  if (is.null(main)) {
    if (nrow(results) > 1) {
      main <- "Confidence Intervals for the Pairwise Standardized Mean Comparisons"
    } else {
      main <- "Confidence Interval for the Pairwise Standardized Mean Comparison"
    }
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotStandardizedMeansPairwise <- function(..., main = NULL, digits = 3, ylab = "Standardized Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, ylim = NULL, add = FALSE, connect = FALSE, pch = 24, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateStandardizedMeansPairwise(..., conf.level = conf.level, mu = mu, main = main, digits = digits)
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}
