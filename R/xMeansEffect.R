# Estimation Approach to Statistical Inference
## Means Effect (Analysis of Variance)

### Descriptives

.describeMeansEffect <- function(x, ...) {
  UseMethod(".describeMeansEffect")
}

.describeMeansEffect.wss <- function(DescStats, CorrStats, ...) {
  n <- DescStats[, "N"]
  m <- DescStats[, "M"]
  sd <- DescStats[, "SD"]
  cov <- .cortocov(CorrStats, sd)
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
  return(results)
}

.describeMeansEffect.bss <- function(DescStats, ...) {
  N <- DescStats[, "N"]
  M <- DescStats[, "M"]
  SD <- DescStats[, "SD"]
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
  return(results)
}

.describeMeansEffect.default <- function(frame, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  results <- .describeMeansEffect.wss(DescStats, CorrStats)
  return(results)
}

.describeMeansEffect.formula <- function(formula, ...) {
  DescStats <- .describeMeans(formula)
  results <- .describeMeansEffect.bss(DescStats)
  return(results)
}

describeMeansEffect <- function(..., main = NULL, digits = 3) {
  results <- .describeMeansEffect(...)
  if (is.null(main)) {
    main <- "Source Table for the Model"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Intervals

.ciEta2 <- function(F, dff, dfe, etasq, conf.level) {
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(.ncpF(F, dff, dfe, prob = (1 + conf.level) / 2), silent = TRUE)
  delta.upper <- try(.ncpF(F, dff, dfe, prob = (1 - conf.level) / 2), silent = TRUE)
  if (is.character(delta.lower)) {
    delta.lower <- 0
  }
  etasq.lower <- delta.lower / (delta.lower + dff + dfe + 1)
  etasq.upper <- delta.upper / (delta.upper + dff + dfe + 1)
  results <- cbind(Est = etasq, LL = etasq.lower, UL = etasq.upper)
  results
}

.estimateMeansEffect <- function(x, ...) {
  UseMethod(".estimateMeansEffect")
}

.estimateMeansEffect.wss <- function(DescStats, CorrStats, conf.level = .90, ...) {
  temptab <- .describeMeansEffect.wss(DescStats, CorrStats)
  SSf <- temptab["Measures", "SS"]
  SSe <- temptab["Error", "SS"]
  SSt <- SSf + SSe
  dff <- temptab["Measures", "df"]
  dfe <- temptab["Error", "df"]
  dft <- dff + dfe
  F <- (SSf / dff) / (SSe / dfe)
  etasq <- SSf / SSt
  results <- .ciEta2(F = F, dff = dff, dfe = dfe, etasq = etasq, conf.level = conf.level)
  rownames(results) <- "Measures"
  return(results)
}

.estimateMeansEffect.bss <- function(DescStats, conf.level = .90, ...) {
  temptab <- .describeMeansEffect.bss(DescStats)
  SSb <- temptab["Between", "SS"]
  SSw <- temptab["Within", "SS"]
  SSt <- SSb + SSw
  dfb <- temptab["Between", "df"]
  dfw <- temptab["Within", "df"]
  dft <- dfb + dfw
  F <- (SSb / dfb) / (SSw / dfw)
  etasq <- SSb / SSt
  results <- .ciEta2(F = F, dff = dfb, dfe = dfw, etasq = etasq, conf.level = conf.level)
  rownames(results) <- "Factor"
  return(results)
}

.estimateMeansEffect.default <- function(frame, conf.level = .90, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .estimateMeansEffect.wss(DescStats, CorrStats, conf.level)
}

.estimateMeansEffect.formula <- function(formula, conf.level = .90, ...) {
  DescStats <- .describeMeans(formula)
  .estimateMeansEffect.bss(DescStats, conf.level)
}

estimateMeansEffect <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansEffect(...)
  if (is.null(main)) {
    main <- "Proportion of Variance Accounted For by the Model"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansEffect <- function(x, ...) {
  UseMethod(".testMeansEffect")
}

.testMeansEffect.wss <- function(DescStats, CorrStats, ...) {
  temptab <- .describeMeansEffect.wss(DescStats, CorrStats)
  MSf <- temptab["Measures", "MS"]
  MSe <- temptab["Error", "MS"]
  dff <- temptab["Measures", "df"]
  dfe <- temptab["Error", "df"]
  F <- MSf / MSe
  p <- 1 - pf(F, dff, dfe)
  results <- cbind(F, dff, dfe, p)
  colnames(results) <- c("F", "df1", "df2", "p")
  rownames(results) <- c("Measures")
  return(results)
}

.testMeansEffect.bss <- function(DescStats, ...) {
  temptab <- .describeMeansEffect.bss(DescStats)
  MSb <- temptab["Between", "MS"]
  MSw <- temptab["Within", "MS"]
  dfb <- temptab["Between", "df"]
  dfw <- temptab["Within", "df"]
  F <- MSb / MSw
  p <- 1 - pf(F, dfb, dfw)
  results <- cbind(F, dfb, dfw, p)
  colnames(results) <- c("F", "df1", "df2", "p")
  rownames(results) <- c("Factor")
  return(results)
}

.testMeansEffect.default <- function(frame, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  DescStats <- .describeMeans(data)
  CorrStats <- .describeCorrelations(data)
  .testMeansEffect.wss(DescStats, CorrStats)
}

.testMeansEffect.formula <- function(formula, ...) {
  DescStats <- .describeMeans(formula)
  .testMeansEffect.bss(DescStats)
}

testMeansEffect <- function(..., main = NULL, digits = 3) {
  results <- .testMeansEffect(...)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Model"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Combined Analyses

analyzeMeansEffect <- function(..., main = NULL, digits = 3) {
  dMO <- describeMeansEffect(..., digits = digits)
  tMO <- testMeansEffect(..., digits = digits)
  eME <- estimateMeansEffect(..., digits = digits)
  results <- c(dMO, tMO, eME)
  return(results)
}
