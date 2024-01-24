# Estimation Approach to Statistical Inference
## Means Posthoc

### Estimate

estimatePosthoc <- estimateMeansPosthoc <- function(x, ...) {
  UseMethod("estimateMeansPosthoc")
}

estimateMeansPosthoc.wsm <- function(moments, corrs, conf.level = .95, mu = 0, ...) {
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
      tcrit <- qtukey(conf.level, nr, df = df) / sqrt(2)
      LL <- MD - tcrit * SEd
      UL <- MD + tcrit * SEd
      results[comp, ] <- c(MD, SEd, df, LL, UL)
      comp <- comp + 1
    }
  }
  comment(results) <- "Confidence Intervals for the Posthoc Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansPosthoc.bsm <- function(moments, conf.level = .95, mu = 0, ...) {
  temp <- describeMeansEffect(moments)
  dfw <- temp["Within", "df"]
  MSw <- temp["Within", "MS"]
  N <- moments[, "N"]
  M <- moments[, "M"]
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
      SEd <- sqrt((MSw / N[rn[i]]) + (MSw / N[rn[j]]))
      df <- dfw
      tcrit <- qtukey(conf.level, nr, df = df) / sqrt(2)
      LL <- MD - tcrit * SEd
      UL <- MD + tcrit * SEd
      results[comp, ] <- c(MD, SEd, df, LL, UL)
      comp <- comp + 1
    }
  }
  comment(results) <- "Confidence Intervals for the Posthoc Mean Differences"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateMeansPosthoc.data.frame <- function(frame, conf.level = .95, mu = 0, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansPosthoc(moments, corrs, conf.level = conf.level, mu = mu, ...)
}

estimateMeansPosthoc.formula <- function(formula, conf.level = .95, mu = 0, ...) {
  moments <- describeMoments(formula)
  estimateMeansPosthoc(moments, conf.level = conf.level, mu = mu, ...)
}

estimateMeansPosthoc.bsml <- function(moments, ...) {
  iterate(moments, estimateMeansPosthoc, ...)
}

estimateMeansPosthoc.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, estimateMeansPosthoc, ...)
}

### Plot

plotPosthoc <- plotMeansPosthoc <- function(..., main = NULL, digits = 3, ylab = "Mean Difference", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, connect = FALSE, ylim = NULL, add = FALSE, pch = 17, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateMeansPosthoc(..., conf.level = conf.level, mu = mu, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, pch = pch, col = col, offset = offset, intervals = intervals)
}

plotPosthocDiffogram <- plotMeansPosthocDiffogram <- function(..., main = NULL, ylab = "", xlab = "", conf.level = .95, ylim = NULL, pch = 17, col = "black") {
  dm <- describeMoments(...)
  emp <- estimateMeansPosthoc(..., conf.level = conf.level)
  .intervals.diffogram(dm = dm, emp = emp, main = main, ylab = ylab, xlab = xlab, ylim = ylim, pch = pch, col = col)
}

### Test

testPosthoc <- testMeansPosthoc <- function(x, ...) {
  UseMethod("testMeansPosthoc")
}

testMeansPosthoc.wsm <- function(moments, corrs, mu = 0, ...) {
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
      p <- 1 - ptukey(abs(t) * sqrt(2), nr, df = df)
      results[comp, ] <- c(MD, SEd, df, t, p)
      comp <- comp + 1
    }
  }
  comment(results) <- "Hypothesis Tests for the Posthoc Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansPosthoc.bsm <- function(moments, mu = 0, ...) {
  temp <- describeMeansEffect(moments)
  dfw <- temp["Within", "df"]
  MSw <- temp["Within", "MS"]
  N <- moments[, "N"]
  M <- moments[, "M"]
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
      SEd <- sqrt((MSw / N[rn[i]]) + (MSw / N[rn[j]]))
      t <- MD / SEd
      df <- dfw
      p <- 1 - ptukey(abs(t) * sqrt(2), nr, df = df)
      results[comp, ] <- c(MD, SEd, df, t, p)
      comp <- comp + 1
    }
  }
  comment(results) <- "Hypothesis Tests for the Posthoc Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansPosthoc.data.frame <- function(frame, mu = 0, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansPosthoc(moments, corrs, mu = mu, ...)
}

testMeansPosthoc.formula <- function(formula, mu = 0, ...) {
  moments <- describeMoments(formula)
  testMeansPosthoc(moments, mu = mu, ...)
}

testMeansPosthoc.bsml <- function(moments, ...) {
  iterate(moments, testMeansPosthoc, ...)
}

testMeansPosthoc.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, testMeansPosthoc, ...)
}

### Standardize

standardizePosthoc <- standardizeMeansPosthoc <- function(x, ...) {
  UseMethod("standardizeMeansPosthoc")
}

standardizeMeansPosthoc.wsm <- function(moments, corrs, conf.level = .95, ...) {
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
  comment(results) <- "Confidence Intervals for the Posthoc Standardized Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

standardizeMeansPosthoc.bsm <- function(moments, conf.level = .95, ...) {
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
  comment(results) <- "Confidence Intervals for the Posthoc Standardized Mean Differences"
  class(results) <- c("easi.frame")
  return(results)
}

standardizeMeansPosthoc.data.frame <- function(frame, conf.level = .95, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  standardizeMeansPosthoc(moments, corrs, conf.level = conf.level, ...)
}

standardizeMeansPosthoc.formula <- function(formula, conf.level = .95, ...) {
  moments <- describeMoments(formula)
  standardizeMeansPosthoc(moments, conf.level = conf.level, ...)
}

standardizeMeansPosthoc.bsml <- function(moments, ...) {
  iterate(moments, standardizeMeansPosthoc, ...)
}

standardizeMeansPosthoc.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, standardizeMeansPosthoc, ...)
}
