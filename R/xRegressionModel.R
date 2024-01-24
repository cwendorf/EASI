# Estimation Approach to Statistical Inference
## Regression Model

### Describe

describeModel <- describeRegressionModel <- function(x, ...) {
  UseMethod("describeRegressionModel")
}

describeRegressionModel.wsm <- function(moments, corrs, y = NULL, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
    corrs <- corrs[rn, rn]
  }
  rn <- rownames(moments)
  rn <- head(rn, -1)
  PredCorr <- corrs[rn, rn]
  corrs <- corrs[, ncol(corrs)]
  corrs <- head(corrs, -1)
  R2 <- as.numeric(t(corrs) %*% solve(PredCorr) %*% corrs)
  df1 <- nrow(moments) - 1
  df2 <- moments[nrow(moments), "N"] - df1 - 1
  vt <- moments[nrow(moments), "SD"]^2
  dft <- df1 + df2
  sst <- vt * dft
  ss1 <- sst * R2
  ss2 <- sst - ss1
  SS <- c(ss1, ss2, sst)
  df <- c(df1, df2, dft)
  MS <- SS / df
  results <- cbind(SS, df, MS)
  rownames(results) <- c("Model", "Error", "Total")
  comment(results) <- "Source Table for the Regression Model"
  class(results) <- "easi.frame"
  return(results)
}

describeRegressionModel.data.frame <- function(frame, y = NULL, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  describeRegressionModel(moments, corrs)
}

### Estimate

.ciR2 <- function(F, df1, df2, R2, conf.level) {
  delta.lower <- delta.upper <- numeric(length(R2))
  delta.lower <- try(.ncpF(F, df1, df2, prob = (1 + conf.level) / 2), silent = TRUE)
  delta.upper <- try(.ncpF(F, df1, df2, prob = (1 - conf.level) / 2), silent = TRUE)
  if (is.character(delta.lower)) {
    delta.lower <- 0
  }
  R2.lower <- delta.lower / (delta.lower + df1 + df2 + 1)
  R2.upper <- delta.upper / (delta.upper + df1 + df2 + 1)
  results <- cbind(Est = R2, LL = R2.lower, UL = R2.upper)
  results
}

estimateModel <- estimateRegressionModel <- function(x, ...) {
  UseMethod("estimateRegressionModel")
}

estimateRegressionModel.wsm <- function(moments, corrs, y = NULL, conf.level = .90, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
    corrs <- corrs[rn, rn]
  }
  temptab <- describeRegressionModel.wsm(moments, corrs)
  df1 <- temptab["Model", "df"]
  df2 <- temptab["Error", "df"]
  F <- temptab["Model", "MS"] / temptab["Error", "MS"]
  R2 <- temptab["Model", "SS"] / temptab["Total", "SS"]
  results <- .ciR2(F = F, df1 = df1, df2 = df2, R2 = R2, conf.level = conf.level)
  rownames(results) <- "Model"
  comment(results) <- "Proportion of Variance Accounted For by the Regression Model"
  class(results) <- "easi.frame"
  return(results)
}

estimateRegressionModel.data.frame <- function(frame, y = NULL, conf.level = .90, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  estimateRegressionModel(moments, corrs, conf.level = conf.level)
}

### Test

testModel <- testRegressionModel <- function(x, ...) {
  UseMethod("testRegressionModel")
}

testRegressionModel.wsm <- function(moments, corrs, y = NULL, ...) {
  if (!is.null(y)) {
    rn <- rownames(moments)
    ri <- which(rn == deparse(substitute(y)))
    rn <- c(rn[-ri], rn[ri])
    moments <- moments[rn, ]
    class(moments) <- "wsm"
    corrs <- corrs[rn, rn]
  }
  temptab <- describeRegressionModel.wsm(moments, corrs)
  MSf <- temptab["Model", "MS"]
  MSe <- temptab["Error", "MS"]
  df1 <- temptab["Model", "df"]
  df2 <- temptab["Error", "df"]
  F <- MSf / MSe
  p <- 1 - pf(F, df1, df2)
  results <- cbind(F, df1, df2, p)
  colnames(results) <- c("F", "df1", "df2", "p")
  rownames(results) <- c("Model")
  comment(results) <- "Hypothesis Test for the Regression Model"
  class(results) <- "easi.frame"
  return(results)
}

testRegressionModel.data.frame <- function(frame, y = NULL, ...) {
  frame <- data.frame(frame)
  if (!is.null(y)) {
    cn <- colnames(frame)
    ci <- which(cn == deparse(substitute(y)))
    cn <- c(cn[-ci], cn[ci])
    frame <- frame[, cn]
  }
  moments <- describeMoments(frame)
  rownames(moments) <- colnames(frame)
  corrs <- describeCorrelations(frame)
  testRegressionModel(moments, corrs)
}
