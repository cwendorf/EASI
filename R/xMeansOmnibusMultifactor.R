# Estimation Approach to Statistical Inference
## Mean Omnibus Analysis (Multifactor Designs)

### Descriptives

.error.list <- function(sourceby) {
  source <- sourceby[[1]] + sourceby[[2]]
  source[, 3] <- source[, 1] / source[, 2]
  return(source)
}

.main.list <- function(meansby) {
  wm <- lapply(meansby, FUN = function(x) (x[, 1] * x[, 2]))
  wm <- matrix(unlist(wm), nrow = length(wm), ncol = length(wm[[1]]), byrow = TRUE)
  n <- lapply(meansby, FUN = function(x) (x[, 1]))
  n <- matrix(unlist(n), nrow = length(n), ncol = length(n[[1]]), byrow = TRUE)
  m <- lapply(meansby, FUN = function(x) (x[, 2]))
  m <- matrix(unlist(m), ncol = length(m[[1]]), nrow = length(m), byrow = TRUE)
  gm <- sum(wm) / sum(n)
  ssmodel <- sum(n * (m - gm)^2)
  num <- apply(wm, 2, sum)
  den <- apply(n, 2, sum)
  mn <- num / den
  ssfa <- sum(den * (mn - gm)^2)
  dfa <- length(mn) - 1
  msa <- ssfa / dfa
  fa <- c(ssfa, dfa, msa)
  num <- apply(wm, 1, sum)
  den <- apply(n, 1, sum)
  mn <- num / den
  ssfb <- sum(den * (mn - gm)^2)
  dfb <- length(mn) - 1
  msb <- ssfb / dfb
  fb <- c(ssfb, dfb, msb)
  ssint <- ssmodel - ssfa - ssfb
  dfint <- dfa * dfb
  msint <- ssint / dfint
  int <- c(ssint, dfint, msint)
  out <- rbind(fb, fa, int)
  colnames(out) <- c("SS", "df", "MS")
  return(out)
}

.describeMeansOmnibusMultifactor <- function(x, ...)
  UseMethod(".describeMeansOmnibusMultifactor")

.describeMeansOmnibusMultifactor.wss <- function(ListDescStats, ListCorrStats, ...) {
  main <- .main.list(ListDescStats)
  ListSourceStats <- .describeMeansOmnibusBy.wss(ListDescStats, ListCorrStats)
  error <- .error.list(ListSourceStats)
  out1 <- rbind(main[1, ], error[1, ])
  rownames(out1) <- c("Blocks", "Subjects")
  out2 <- rbind(main[2:3, ], error[-1:-2, ])
  rownames(out2) <- c("Measures", "Measures:Blocks", "Residual")
  results <- list(out1, out2)
  names(results) <- c("Between Subjects", "Within Subjects")
  return(results)
}

.describeMeansOmnibusMultifactor.bss <- function(ListDescStats, ...) {
  main <- .main.list(ListDescStats)
  ListSourceStats <- .describeMeansOmnibusBy.bss(ListDescStats)
  error <- .error.list(ListSourceStats)
  out <- rbind(main[1:3, ], error[-1, ])
  rownames(out) <- c("Factor", "Blocks", "Factor:Blocks", "Residual")
  results <- list(out)
  names(results) <- "Between Subjects"
  return(results)
}

.describeMeansOmnibusMultifactor.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy.default(data, by = by)
  ListCorrStats <- .describeCorrelationsBy.default(data, by = by)
  .describeMeansOmnibusMultifactor.wss(ListDescStats, ListCorrStats)
}

.describeMeansOmnibusMultifactor.formula <- function(formula, by, ...) {
  ListDescStats <- .describeMeansBy.formula(formula, by = by)
  .describeMeansOmnibusMultifactor.bss(ListDescStats)
}

describeMeansOmnibusMultifactor <- function(..., main = NULL, digits = 3) {
  results <- .describeMeansOmnibusMultifactor(...)
  if (is.null(main)) {main <- "Source Table for the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Intervals

.estimateMeansOmnibusMultifactor <- function(x, ...)
  UseMethod(".estimateMeansOmnibusMultifactor")

.estimateMeansOmnibusMultifactor.wss <- function(ListDescStats, ListCorrStats, conf.level = .90, ...) {
  x <- .describeMeansOmnibusMultifactor.wss(ListDescStats, ListCorrStats)
  results <- cbind(x[[1]], F = NA, Est = NA, LL = NA, UL = NA)
  results[, 4] <- results[, 3] / tail(results[, 3], 1)
  results[, 5] <- results[, 1] / (results[, 1] + tail(results[, 1], 1))
  results[1, 5:7] <- .ciEta2(results[1, 4], results[1, 2], tail(results[, 2], 1), results[1, 5], conf.level = conf.level)
  results1 <- results
  results <- cbind(x[[2]], F = NA, Est = NA, LL = NA, UL = NA)
  results[, 4] <- results[, 3] / tail(results[, 3], 1)
  results[, 5] <- results[, 1] / (results[, 1] + tail(results[, 1], 1))
  results[1, 5:7] <- .ciEta2(results[1, 4], results[1, 2], tail(results[, 2], 1), results[1, 5], conf.level = conf.level)
  results[2, 5:7] <- .ciEta2(results[2, 4], results[2, 2], tail(results[, 2], 1), results[2, 5], conf.level = conf.level)
  results2 <- results
  results <- list(results1, results2)
  names(results) <- c("Between Subjects", "Within Subjects")
  results[[1]] <- rbind(results[[1]][-2, 5:7])
  rownames(results[[1]]) <- "Blocks"
  results[[2]] <- as.data.frame(results[[2]][-3, 5:7])
  return(results)
}

.estimateMeansOmnibusMultifactor.bss <- function(ListDescStats, conf.level = .90, ...) {
  x <- .describeMeansOmnibusMultifactor.bss(ListDescStats)
  results <- cbind(x[[1]], F = NA, Est = NA, LL = NA, UL = NA)
  results[, 4] <- results[, 3] / tail(results[, 3], 1)
  results[, 5] <- results[, 1] / (results[, 1] + tail(results[, 1], 1))
  results[1, 5:7] <- .ciEta2(results[1, 4], results[1, 2], tail(results[, 2], 1), results[1, 5], conf.level = conf.level)
  results[2, 5:7] <- .ciEta2(results[2, 4], results[1, 2], tail(results[, 2], 1), results[2, 5], conf.level = conf.level)
  results[3, 5:7] <- .ciEta2(results[3, 4], results[1, 2], tail(results[, 2], 1), results[3, 5], conf.level = conf.level)
  results <- list(results[-4, 5:7])
  names(results) <- "Between Subjects"
  return(results)
}

.estimateMeansOmnibusMultifactor.default <- function(frame, by, conf.level = .90, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy.default(data, by = by)
  ListCorrStats <- .describeCorrelationsBy.default(data, by = by)
  .estimateMeansOmnibusMultifactor.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
}

.estimateMeansOmnibusMultifactor.formula <- function(formula, by, conf.level = .90, ...) {
  ListDescStats <- .describeMeansBy.formula(formula, by = by)
  .estimateMeansOmnibusMultifactor.bss(ListDescStats, conf.level = conf.level)
}

estimateMeansOmnibusMultifactor <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansOmnibusMultifactor(...)
  if (is.null(main)) {main <- "Proportion of Variance Accounted For by the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibusMultifactor <- function(x, ...)
  UseMethod(".testMeansOmnibusMultifactor")

.testMeansOmnibusMultifactor.wss <- function(ListDescStats, ListCorrStats, ...) {
  out <- .describeMeansOmnibusMultifactor.wss(ListDescStats, ListCorrStats)
  for (i in 1:length(out)) {
    out[[i]] = cbind(out[[i]], NA, NA, NA, NA)
    out[[i]][, 4] <- out[[i]][, 3] / tail(out[[i]][, 3], 1)
    out[[i]][, 5] <- out[[i]][, 2]
    out[[i]][, 6] <- tail(out[[i]][, 2], 1)
    out[[i]][, 7] <- 1 - pf(out[[i]][, 4], out[[i]][, 2], tail(out[[i]][, 2], 1))
    out[[i]] <- out[[i]][, 4:7]
    colnames(out[[i]]) <- c("F", "df1", "df2", "p")
  }
  out[[1]] = rbind(out[[1]][-2, ])
  rownames(out[[1]]) = "Blocks"
  out[[2]] = as.data.frame(out[[2]][-3, ])
  return(out)
}

.testMeansOmnibusMultifactor.bss <- function(ListDescStats, ...) {
  out <- .describeMeansOmnibusMultifactor.bss(ListDescStats)
  i = 1
  out[[i]] <- cbind(out[[i]], NA, NA, NA, NA)
  out[[i]][, 4] <- out[[i]][, 3] / tail(out[[i]][, 3], 1)
  out[[i]][, 5] <- out[[i]][, 2]
  out[[i]][, 6] <- tail(out[[i]][, 2], 1)
  out[[i]][, 7] <- 1 - pf(out[[i]][, 4], out[[i]][, 2], tail(out[[i]][, 2], 1))
  out[[i]] <- out[[i]][-4, 4:7]
  colnames(out[[i]]) <- c("F", "df1", "df2", "p")
  return(out)
}

.testMeansOmnibusMultifactor.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy.default(data, by = by)
  ListCorrStats <- .describeCorrelationsBy.default(data, by = by)
  .testMeansOmnibusMultifactor.wss(ListDescStats, ListCorrStats)
}

.testMeansOmnibusMultifactor.formula <- function(formula, by, ...) {
  ListDescStats <- .describeMeansBy.formula(formula, by = by)
  .testMeansOmnibusMultifactor.bss(ListDescStats)
}

testMeansOmnibusMultifactor <- function(..., main = NULL, digits = 3) {
  results <- .testMeansOmnibusMultifactor(...)
  if (is.null(main)) {main <- "Hypothesis Tests for the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
