# Estimation Approach to Statistical Inference
## Means Effect

### Describe

describeEffect <- describeMeansEffect <- function(x, ...) {
  UseMethod("describeMeansEffect")
}

describeMeansEffect.wsm <- function(moments, corrs, ...) {
  n <- moments[, "N"]
  m <- moments[, "M"]
  sd <- moments[, "SD"]
  cov <- .cortocov(corrs, sd)
  Mcov <- mean(cov[lower.tri(cov)])
  a <- length(m)
  Mt <- mean(m)
  N <- sum(n)
  dfa <- a - 1
  MSa <- sum(n * (m - Mt)^2) / (a - 1)
  SSa <- dfa * MSa
  dfw <- N - a
  MSw <- sum((n - 1) * sd^2) / sum(n - 1)
  SSw <- dfw * MSw
  MSas <- MSw - Mcov
  dfas <- (a - 1) * (n[[1]] - 1)
  SSas <- dfas * MSas
  dfs <- n[[1]] - 1
  SSs <- SSw - SSas
  MSs <- SSs / dfs
  results <- rbind(c(SSs, dfs, MSs), c(SSa, dfa, MSa), c(SSas, dfas, MSas))
  colnames(results) <- c("SS", "df", "MS")
  rownames(results) <- c("Subjects", "Measures", "Error")
  comment(results) <- "Source Table for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

describeMeansEffect.bsm <- function(moments, ...) {
  N <- moments[, "N"]
  M <- moments[, "M"]
  SD <- moments[, "SD"]
  k <- length(M)
  dfb <- k - 1
  dfw <- sum(N) - k
  Xg <- sum(N * M) / sum(N)
  MSb <- sum(N * (M - Xg)^2) / (k - 1)
  MSw <- sum((N - 1) * SD^2) / dfw
  SSb <- dfb * MSb
  SSw <- dfw * MSw
  results <- rbind(c(SSb, dfb, MSb), c(SSw, dfw, MSw))
  colnames(results) <- c("SS", "df", "MS")
  rownames(results) <- c("Between", "Within")
  comment(results) <- "Source Table for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

describeMeansEffect.data.frame <- function(frame, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  results <- describeMeansEffect(moments, corrs, ...)
  return(results)
}

describeMeansEffect.formula <- function(formula, ...) {
  moments <- describeMoments(formula)
  results <- describeMeansEffect(moments, ...)
  return(results)
}

describeMeansEffect.bsml <- function(moments, ...) {
  iterate(moments, describeMeansEffect, ...)
}

describeMeansEffect.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, describeMeansEffect, ...)
}

### Estimate

.ncpF <- function(x, df1, df2, prob, interval = c(0, 10000), my.tol = 0.000001) {
  temp <- function(ncp) pf(x, df1, df2, ncp) - prob
  return(uniroot(temp, interval, tol = my.tol)$root)
}

.ciEta2 <- function(F, dff, dfe, etasq, conf.level) {
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(.ncpF(F, dff, dfe, prob = (1 + conf.level) / 2), silent = TRUE)
  delta.upper <- try(.ncpF(F, dff, dfe, prob = (1 - conf.level) / 2), silent = TRUE)
  if (is.character(delta.lower)) delta.lower <- 0
  etasq.lower <- delta.lower / (delta.lower + dff + dfe + 1)
  etasq.upper <- delta.upper / (delta.upper + dff + dfe + 1)
  results <- cbind(Est = etasq, LL = etasq.lower, UL = etasq.upper)
  results
}

estimateEffect <- estimateMeansEffect <- function(x, ...) {
  UseMethod("estimateMeansEffect")
}

estimateMeansEffect.wsm <- function(moments, corrs, conf.level = .90, ...) {
  temp <- describeMeansEffect(moments, corrs)
  SSf <- temp["Measures", "SS"]
  SSe <- temp["Error", "SS"]
  SSt <- SSf + SSe
  dff <- temp["Measures", "df"]
  dfe <- temp["Error", "df"]
  F <- (SSf / dff) / (SSe / dfe)
  etasq <- SSf / SSt
  results <- .ciEta2(F = F, dff = dff, dfe = dfe, etasq = etasq, conf.level = conf.level)
  rownames(results) <- "Measures"
  comment(results) <- "Proportion of Variance Accounted For by the Model"
  class(results) <- c("easi.frame")
  return(results)
}

estimateMeansEffect.bsm <- function(moments, conf.level = .90, ...) {
  temp <- describeMeansEffect(moments)
  SSb <- temp["Between", "SS"]
  SSw <- temp["Within", "SS"]
  SSt <- SSb + SSw
  dfb <- temp["Between", "df"]
  dfw <- temp["Within", "df"]
  F <- (SSb / dfb) / (SSw / dfw)
  etasq <- SSb / SSt
  results <- .ciEta2(F = F, dff = dfb, dfe = dfw, etasq = etasq, conf.level = conf.level)
  rownames(results) <- "Factor"
  comment(results) <- "Proportion of Variance Accounted For by the Model"
  class(results) <- c("easi.frame")
  return(results)
}

estimateMeansEffect.data.frame <- function(frame, conf.level = .90, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  estimateMeansEffect(moments, corrs, conf.level, ...)
}

estimateMeansEffect.formula <- function(formula, conf.level = .90, ...) {
  moments <- describeMoments(formula)
  estimateMeansEffect(moments, conf.level, ...)
}

estimateMeansEffect.bsml <- function(moments, ...) {
  iterate(moments, estimateMeansEffect, ...)
}

estimateMeansEffect.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, estimateMeansEffect, ...)
}

### Test

testEffect <- testMeansEffect <- function(x, ...) {
  UseMethod("testMeansEffect")
}

testMeansEffect.wsm <- function(moments, corrs, ...) {
  temp <- describeMeansEffect(moments, corrs)
  MSf <- temp["Measures", "MS"]
  MSe <- temp["Error", "MS"]
  dff <- temp["Measures", "df"]
  dfe <- temp["Error", "df"]
  F <- MSf / MSe
  p <- 1 - pf(F, dff, dfe)
  results <- cbind(F, dff, dfe, p)
  colnames(results) <- c("F", "df1", "df2", "p")
  rownames(results) <- c("Measures")
  comment(results) <- "Hypothesis Test for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansEffect.bsm <- function(moments, ...) {
  temp <- describeMeansEffect(moments)
  MSb <- temp["Between", "MS"]
  MSw <- temp["Within", "MS"]
  dfb <- temp["Between", "df"]
  dfw <- temp["Within", "df"]
  F <- MSb / MSw
  p <- 1 - pf(F, dfb, dfw)
  results <- cbind(F, dfb, dfw, p)
  colnames(results) <- c("F", "df1", "df2", "p")
  rownames(results) <- c("Factor")
  comment(results) <- "Hypothesis Test for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansEffect.data.frame <- function(frame, ...) {
  moments <- describeMoments(frame)
  corrs <- describeCorrelations(frame)
  testMeansEffect(moments, corrs, ...)
}

testMeansEffect.formula <- function(formula, ...) {
  moments <- describeMoments(formula)
  testMeansEffect(moments, ...)
}

testMeansEffect.bsml <- function(moments, ...) {
  iterate(moments, testMeansEffect, ...)
}

testMeansEffect.wsml <- function(moments, corrs, ...) {
  iterate(moments, corrs, testMeansEffect, ...)
}
