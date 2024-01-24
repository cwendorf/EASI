# Estimation Approach to Statistical Inference
## Means Factorial

### Describe

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

describeFactorial <- describeMeansFactorial <- function(x, ...) {
  UseMethod("describeMeansFactorial")
}

describeMeansFactorial.wsml <- function(moments, corrs, ...) {
  main <- .main.list(moments)
  temp <- describeMeansEffect(moments, corrs)
  error <- .error.list(temp)
  out1 <- rbind(main[1, ], error[1, ])
  rownames(out1) <- c("Blocks", "Subjects")
  comment(out1) <- "Source Table for the Model"
  class(out1) <- c("easi.frame")
  out2 <- rbind(main[2:3, ], error[-1:-2, ])
  rownames(out2) <- c("Measures", "Measures:Blocks", "Residual")
  comment(out2) <- "Source Table for the Model"
  class(out2) <- c("easi.frame")
  results <- list(out1, out2)
  names(results) <- c("Between Subjects", "Within Subjects")
  #results <- .deList(results)
  comment(results) <- "Source Table for the Model"
  class(results) <- c("easi.list")
  return(results)
}

describeMeansFactorial.bsml <- function(moments, ...) {
  main <- .main.list(moments)
  temp <- describeMeansEffect(moments)
  error <- .error.list(temp)
  results <- rbind(main[1:3, ], error[-1, ])
  rownames(results) <- c("Factor", "Blocks", "Factor:Blocks", "Residual")
  comment(results) <- "Source Table for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

describeMeansFactorial.data.frame <- function(frame, by, ...) {
  moments <- describeMomentsBy(frame, by = by)
  corrs <- describeCorrelationsBy(frame, by = by)
  describeMeansFactorial(moments, corrs, ...)
}

describeMeansFactorial.formula <- function(formula, by, ...) {
  moments <- describeMomentsBy(formula, by = by)
  describeMeansFactorial(moments, ...)
}

### Estimate

estimateFactorial <- estimateMeansFactorial <- function(x, ...) {
  UseMethod("estimateMeansFactorial")
}

estimateMeansFactorial.wsml <- function(moments, corrs, conf.level = .90, ...) {
  x <- describeMeansFactorial(moments, corrs)
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
  comment(results[[1]]) <- "Proportion of Variance Accounted For by the Model"
  class(results[[1]]) <- c("easi.frame")
  results[[2]] <- rbind(results[[2]][-3, 5:7])
  comment(results[[2]]) <- "Proportion of Variance Accounted For by the Model"
  class(results[[2]]) <- c("easi.frame")
  #results <- .deList(results)
  comment(results) <- "Proportion of Variance Accounted For by the Model"
  class(results) <- c("easi.list")
  return(results)
}

estimateMeansFactorial.bsml <- function(moments, conf.level = .90, ...) {
  x <- describeMeansFactorial(moments)
  results <- cbind(x, F = NA, Est = NA, LL = NA, UL = NA)
  results[, 4] <- results[, 3] / tail(results[, 3], 1)
  results[, 5] <- results[, 1] / (results[, 1] + tail(results[, 1], 1))
  results[1, 5:7] <- .ciEta2(results[1, 4], results[1, 2], tail(results[, 2], 1), results[1, 5], conf.level = conf.level)
  results[2, 5:7] <- .ciEta2(results[2, 4], results[1, 2], tail(results[, 2], 1), results[2, 5], conf.level = conf.level)
  results[3, 5:7] <- .ciEta2(results[3, 4], results[1, 2], tail(results[, 2], 1), results[3, 5], conf.level = conf.level)
  results <- results[-4, 5:7]
  comment(results) <- "Proportion of Variance Accounted For by the Model"
  class(results) <- c("easi.frame")
  return(results)
}

estimateMeansFactorial.data.frame <- function(frame, by, conf.level = .90, ...) {
  moments <- describeMomentsBy(frame, by = by)
  corrs <- describeCorrelationsBy(frame, by = by)
  estimateMeansFactorial(moments, corrs, conf.level = conf.level, ...)
}

estimateMeansFactorial.formula <- function(formula, by, conf.level = .90, ...) {
  moments <- describeMomentsBy(formula, by = by)
  estimateMeansFactorial(moments, conf.level = conf.level, ...)
}

### Plot

plotFactorial <- plotMeansFactorial <- function(x, ...) {
  UseMethod("plotMeansFactorial")
}

plotMeansFactorial.data.frame <- plotMeansFactorial.formula <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, col = "black") {
  moments <- describeMoments(..., by = by)
  results <- estimateMeans(moments, conf.level = conf.level)
  plot.intervals.multi(results, main = main, ylab = ylab, xlab = xlab, col = col)
  invisible(eval(...))
}

plotMeansFactorial.bsml <- plotMeansFactorial.wsml <- function(results, main = NULL, ylab = "Outcome", xlab = "", col = "black", ...) {
  results <- estimateMeans(results, ...)
  plot.intervals.multi(results, main = main, ylab = ylab, xlab = xlab, col = col)
  invisible(eval(results))
}

### Test

testFactorial <- testMeansFactorial <- function(x, ...) {
  UseMethod("testMeansFactorial")
}

testMeansFactorial.wsml <- function(moments, corrs, ...) {
  results <- describeMeansFactorial(moments, corrs)
  for (i in 1:length(results)) {
    results[[i]] <- cbind(results[[i]], NA, NA, NA, NA)
    results[[i]][, 4] <- results[[i]][, 3] / tail(results[[i]][, 3], 1)
    results[[i]][, 5] <- results[[i]][, 2]
    results[[i]][, 6] <- tail(results[[i]][, 2], 1)
    results[[i]][, 7] <- 1 - pf(results[[i]][, 4], results[[i]][, 2], tail(results[[i]][, 2], 1))
    results[[i]] <- results[[i]][, 4:7]
    colnames(results[[i]]) <- c("F", "df1", "df2", "p")
  }
  results[[1]] <- rbind(results[[1]][-2, ])
  rownames(results[[1]]) <- "Blocks"
  class(results[[1]]) <- c("easi.frame")
  comment(results[[1]]) <- "Hypothesis Tests for the Model"
  results[[2]] <- rbind(results[[2]][-3, ])
  class(results[[2]]) <- c("easi.frame")
  comment(results[[2]]) <- "Hypothesis Tests for the Model"
  #results <- .deList(results)
  comment(results) <- "Hypothesis Tests for the Model"
  class(results) <- c("easi.list")
  return(results)
}

testMeansFactorial.bsml <- function(moments, ...) {
  results <- describeMeansFactorial(moments)
  results <- cbind(results, NA, NA, NA, NA)
  results[, 4] <- results[, 3] / tail(results[, 3], 1)
  results[, 5] <- results[, 2]
  results[, 6] <- tail(results[, 2], 1)
  results[, 7] <- 1 - pf(results[, 4], results[, 2], tail(results[, 2], 1))
  results <- results[-4, 4:7]
  colnames(results) <- c("F", "df1", "df2", "p")
  comment(results) <- "Hypothesis Tests for the Model"
  class(results) <- c("easi.frame")
  return(results)
}

testMeansFactorial.data.frame <- function(frame, by, ...) {
  moments <- describeMomentsBy(frame, by = by)
  corrs <- describeCorrelationsBy(frame, by = by)
  testMeansFactorial(moments, corrs, ...)
}

testMeansFactorial.formula <- function(formula, by, ...) {
  moments <- describeMomentsBy(formula, by = by)
  testMeansFactorial(moments, ...)
}
