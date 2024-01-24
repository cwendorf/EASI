# Estimation Approach to Statistical Inference
## Correlations

### Describe

.cortocov <- function(corrs, SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * corrs
  return(covstats)
}

describeCorrelations <- describeCorrelationsSet <- function(x, ...) {
  UseMethod("describeCorrelationsSet")
}

describeCorrelationsSet.data.frame <- function(frame, ...) {
  results <- cor(frame)
  class(results) <- c("easi.frame", "cor")
  comment(results) <- "Correlations for the Data"
  return(results)
}

describeCorrelationsSet.cor <- function(cor, ...) {
  return(cor)
}

describeCorrelationsSet.wsm <- function(wsm, cor, ...) {
  return(cor)
}

describeCorrelationsSet.corl <- function(list, ...) {
  results <- lapply(list, describeCorrelations, ...)
  return(results)
}

describeCorrelationsBy <- function(x, ...) {
  UseMethod("describeCorrelationsBy")
}

describeCorrelationsBy.data.frame <- function(frame, by, ...) {
  MixedData <- data.frame(by, frame)
  SplitData <- split(MixedData[-1], by)
  results <- lapply(SplitData, describeCorrelations)
  results
}

describeCorrelationsBy.corl <- function(list, ...) {
  results <- lapply(list, describeCorrelations, ...)
  return(results)
}

describeCorrelations <- function(x, by = NULL, ...) {
  if (!is.null(by)) {
    describeCorrelationsBy(x, by, ...)
  } else {
    describeCorrelationsSet(x, ...)
  }
}

### Estimate

estimateCorrelations <- estimateCorrelationsSet <- function(x, ...) {
  UseMethod("estimateCorrelationsSet")
}

estimateCorrelationsSet.wsm <- function(moments, corrs, conf.level = .95, ...) {
  N <- moments[, "N"]
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- as.data.frame(matrix(ncol = 4, nrow = ncomp))
  colnames(results) <- c("R", "SE", "LL", "UL")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "&", rn[j])
      n <- min(N[rn[j]], N[rn[i]])
      R <- corrs[rn[i], rn[j]]
      z <- qnorm((1 + conf.level) / 2)
      SE <- sqrt(1 / ((n - 3)))
      zR <- log((1 + R) / (1 - R)) / 2
      LL0 <- zR - z * SE
      UL0 <- zR + z * SE
      LL <- (exp(2 * LL0) - 1) / (exp(2 * LL0) + 1)
      UL <- (exp(2 * UL0) - 1) / (exp(2 * UL0) + 1)
      results[comp, ] <- c(R, SE, LL, UL)
      comp <- comp + 1
    }
  }
  results <- as.matrix(results)
  comment(results) <- "Confidence Intervals for the Correlations"
  class(results) <- c("easi.frame", "intervals.main")
  return(results)
}

estimateCorrelationsSet.data.frame <- function(frame, conf.level = .95, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelationsSet(frame)
  estimateCorrelationsSet(moments, corrs, conf.level = conf.level)
}

estimateCorrelationsSet.wsml <- function(moments, corrs, func, ...) {
  iterate(moments, corrs, estimateCorrelationsSet, ...)
}

### Plot

plotCorrelations <- plotCorrelationsSet <- function(x, ...) {
  UseMethod("plotCorrelationsSet")
}

plotCorrelationsSet.data.frame <- function(frame, main = NULL, digits = 3, ylab = "Correlation", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, ylim = c(-1.1, 1.1), add = FALSE, pch = 16, connect = FALSE, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateCorrelationsSet(frame, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
}

plotCorrelationsSet.wsm <- function(moments, corrs, main = NULL, digits = 3, ylab = "Correlation", xlab = "", mu = 0, line = NULL, rope = NULL, conf.level = .95, values = TRUE, pos = 2, ylim = c(-1.1, 1.1), add = FALSE, pch = 16, connect = FALSE, col = "black", offset = 0, intervals = TRUE) {
  results <- estimateCorrelationsSet(moments, corrs, main = main, digits = digits)
  plot(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
}

### Test

testCorrelations <- testCorrelationsSet <- function(x, ...) {
  UseMethod("testCorrelationsSet")
}

testCorrelationsSet.wsm <- function(moments, corrs, ...) {
  N <- moments[, "N"]
  rn <- rownames(moments)
  nr <- nrow(moments)
  ncomp <- (nr) * (nr - 1) / 2
  results <- data.frame(matrix(ncol = 5, nrow = ncomp))
  colnames(results) <- c("R", "SE", "df", "t", "p")
  comp <- 1
  for (i in 1:(nr - 1)) {
    for (j in (i + 1):nr) {
      rownames(results)[comp] <- paste(rn[i], "&", rn[j])
      n <- min(N[rn[j]], N[rn[i]])
      R <- corrs[rn[i], rn[j]]
      df <- n - 2
      SE <- sqrt((1 - R^2) / (df))
      t <- R / SE
      p <- 2 * (1 - pt(abs(t), df))
      results[comp, ] <- c(R, SE, df, t, p)
      comp <- comp + 1
    }
  }
  results <- as.matrix(results)
  comment(results) <- "Hypothesis Tests for the Correlations"
  class(results) <- c("easi.frame")
  return(results)
}

testCorrelationsSet.data.frame <- function(frame, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelationsSet(frame)
  testCorrelationsSet(moments, corrs)
}
