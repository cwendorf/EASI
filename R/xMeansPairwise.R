# Estimation Approach to Statistical Inference
## Means Pairwise

### Estimate

estimatePairwise <- estimateMeansPairwise <- function(x, ...) {
  UseMethod("estimateMeansPairwise")
}

estimateMeansPairwise.wsm <- function(moments, corrs, conf.level = .95, mu = 0, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  SE <- SD / sqrt(N)
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- (matrix(ncol = 5, nrow = ncomp))
  colnames(results) <- c("Diff", "SE", "df", "LL", "UL")
  rownames(results) <- c(1:ncomp)
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      MD <- M[rn[j]] - M[rn[i]] - mu
      SEd <- sqrt(SE[rn[i]]^2 + SE[rn[j]]^2 - 2 * corrs[rn[i], rn[j]] * SE[rn[i]] * SE[rn[j]])
      df <- min(N) - 1
      tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
      LL <- MD - tcrit * SEd
      UL <- MD + tcrit * SEd
      results[comp, ] <- c(MD, SEd, df, LL, UL)
      comp <- comp + 1
    }
  }
  comment(results) <- "Confidence Intervals for the Pairwise Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansPairwise.bsm <- function(moments, conf.level = .95, mu = 0, ...) {
  N <- t(combn(moments[, "N"], 2))
  M <- t(combn(moments[, "M"], 2))
  SD <- t(combn(moments[, "SD"], 2))
  MD <- M[, 2] - M[, 1] - mu
  SE <- sqrt((SD[, 1]^2 / N[, 1]) + (SD[, 2]^2 / N[, 2]))
  df <- ((SD[, 1]^2 / N[, 1] + SD[, 2]^2 / N[, 2])^2) / ((SD[, 1]^2 / N[, 1])^2 / (N[, 1] - 1) + (SD[, 2]^2 / N[, 2])^2 / (N[, 2] - 1))
  tcrit <- qt((1 - conf.level) / 2, df, lower.tail = FALSE)
  LL <- MD - tcrit * SE
  UL <- MD + tcrit * SE
  results <- cbind(MD, SE, df, LL, UL)
  rn <- t(combn(rownames(moments), 2))
  rownames(results) <- paste(rn[, 1], "v", rn[, 2])
  comment(results) <- "Confidence Intervals for the Pairwise Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansPairwise.data.frame <- function(frame, conf.level = .95, mu = 0, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansPairwise(moments, corrs, conf.level = conf.level, mu = mu, ...)
}

estimateMeansPairwise.formula <- function(formula, conf.level = .95, mu = 0, ...) {
  moments <- describeMoments(formula)
  estimateMeansPairwise(moments, conf.level = conf.level, mu = mu, ...)
}

estimateMeansPairwise.bsml <- function(moments, ...) {
  iterate(moments, estimateMeansPairwise, ...)
}

estimateMeansPairwise.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, estimateMeansPairwise, ...)
}

### Plot

plotPairwise <- plotMeansPairwise <- function(..., main = NULL, digits = 3, ylab = "Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, ylim = NULL, add = FALSE, connect = FALSE, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansPairwise(..., conf.level = conf.level, mu = mu, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotPairwiseDiffogram <- plotMeansPairwiseDiffogram <- function(..., main = NULL, ylab = "", xlab = "", conf.level = .95, ylim = NULL, pch = 17, col = "black") {
  dm <- describeMoments(...)
  emp <- estimateMeansPairwise(..., conf.level = conf.level)
  .intervals.diffogram(dm = dm, emp = emp, main = main, ylab = ylab, xlab = xlab, ylim = ylim, pch = pch, col = col)
}

### Test

testPairwise <- testMeansPairwise <- function(x, ...) {
  UseMethod("testMeansPairwise")
}

testMeansPairwise.wsm <- function(moments, corrs, mu = 0, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  SE <- SD / sqrt(N)
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- (matrix(ncol = 5, nrow = ncomp))
  colnames(results) <- c("Diff", "SE", "df", "t", "p")
  rownames(results) <- c(1:ncomp)
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      MD <- M[rn[j]] - M[rn[i]] - mu
      SEd <- sqrt(SE[rn[i]]^2 + SE[rn[j]]^2 - 2 * corrs[rn[i], rn[j]] * SE[rn[i]] * SE[rn[j]])
      df <- min(N) - 1
      t <- MD / SEd
      p <- 2 * (1 - pt(abs(t), df))
      results[comp, ] <- c(MD, SEd, df, t, p)
      comp <- comp + 1
    }
  }
  comment(results) <- "Hypothesis Tests for the Pairwise Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansPairwise.bsm <- function(moments, mu = 0, ...) {
  N <- t(combn(moments[, "N"], 2))
  M <- t(combn(moments[, "M"], 2))
  SD <- t(combn(moments[, "SD"], 2))
  MD <- M[, 2] - M[, 1] - mu
  SE <- sqrt((SD[, 1]^2 / N[, 1]) + (SD[, 2]^2 / N[, 2]))
  df <- ((SD[, 1]^2 / N[, 1] + SD[, 2]^2 / N[, 2])^2) / ((SD[, 1]^2 / N[, 1])^2 / (N[, 1] - 1) + (SD[, 2]^2 / N[, 2])^2 / (N[, 2] - 1))
  t <- MD / SE
  p <- 2 * (1 - pt(abs(t), df))
  results <- cbind(MD, SE, df, t, p)
  rn <- t(combn(rownames(moments), 2))
  rownames(results) <- paste(rn[, 1], "v", rn[, 2])
  comment(results) <- "Hypothesis Tests for the Pairwise Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansPairwise.data.frame <- function(frame, mu = 0, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansPairwise(moments, corrs, mu = mu, ...)
}

testMeansPairwise.formula <- function(formula, mu = 0, ...) {
  moments <- describeMoments(formula)
  testMeansPairwise(moments, mu = mu, ...)
}

testMeansPairwise.bsml <- function(moments, ...) {
  iterate(moments, testMeansPairwise, ...)
}

testMeansPairwise.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, testMeansPairwise, ...)
}

### Standardize

standardizePairwise <- standardizeMeansPairwise <- function(x, ...) {
  UseMethod("standardizeMeansPairwise")
}

standardizeMeansPairwise.wsm <- function(moments, corrs, conf.level = .95, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- (matrix(ncol = 4, nrow = ncomp))
  colnames(results) <- c("d", "SE", "LL", "UL")
  rownames(results) <- c(1:ncomp)
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
      R <- corrs[rn[1], rn[2]]
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
  comment(results) <- "Confidence Intervals for the Pairwise Standardized Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansPairwise.bsm <- function(moments, conf.level = .95, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- (matrix(ncol = 4, nrow = ncomp))
  colnames(results) <- c("d", "SE", "LL", "UL")
  rownames(results) <- c(1:ncomp)
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "v", rn[j])
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
  comment(results) <- "Confidence Intervals for the Pairwise Standardized Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

standardizeMeansPairwise.data.frame <- function(frame, conf.level = .95, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  standardizeMeansPairwise(moments, corrs, conf.level = conf.level, ...)
}

standardizeMeansPairwise.formula <- function(formula, conf.level = .95, ...) {
  moments <- describeMoments(formula)
  standardizeMeansPairwise(moments, conf.level = conf.level, ...)
}

standardizeMeansPairwise.bsml <- function(moments, ...) {
  iterate(moments, standardizeMeansPairwise, ...)
}

standardizeMeansPairwise.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, standardizeMeansPairwise, ...)
}
