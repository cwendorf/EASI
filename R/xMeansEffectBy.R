# Estimation Approach to Statistical Inference
## Means Effect By

### Descriptives

.describeMeansEffectBy <- function(x, ...) {
  UseMethod(".describeMeansEffectBy")
}

.describeMeansEffectBy.wss <- function(ListDescStats, ListCorrStats, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .describeMeansEffect.wss(ListDescStats[[i]], ListCorrStats[[i]])
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansEffectBy.bss <- function(ListDescStats, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .describeMeansEffect.bss(ListDescStats[[i]])
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansEffectBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .describeMeansEffectBy.wss(ListDescStats, ListCorrStats)
  return(results)
}

.describeMeansEffectBy.formula <- function(formula, by, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .describeMeansEffectBy.bss(ListDescStats)
  return(results)
}

describeMeansEffectBy <- function(..., main = NULL, digits = 3) {
  results <- .describeMeansEffectBy(...)
  if (is.null(main)) {
    main <- "Source Table for the Model"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Intervals

.estimateMeansEffectBy <- function(x, ...) {
  UseMethod(".estimateMeansEffectBy")
}

.estimateMeansEffectBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .90, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansEffect.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansEffectBy.bss <- function(ListDescStats, conf.level = .90, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateMeansEffect.bss(ListDescStats[[i]], conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansEffectBy.default <- function(frame, by, conf.level = .90, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansEffectBy.wss(ListDescStats, ListCorrStats, conf.level)
  return(results)
}

.estimateMeansEffectBy.formula <- function(formula, by, conf.level = .90, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateMeansEffectBy.bss(ListDescStats, conf.level)
  return(results)
}

estimateMeansEffectBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansEffectBy(...)
  if (is.null(main)) {
    main <- "Proportion of Variance Accounted For by the Model"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansEffectBy <- function(x, ...) {
  UseMethod(".testMeansEffectBy")
}

.testMeansEffectBy.wss <- function(ListDescStats, ListCorrStats, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansEffect.wss(ListDescStats[[i]], ListCorrStats[[i]])
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansEffectBy.bss <- function(ListDescStats) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .testMeansEffect.bss(ListDescStats[[i]])
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansEffectBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansEffectBy.wss(ListDescStats, ListCorrStats)
  return(results)
}

.testMeansEffectBy.formula <- function(formula, by, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .testMeansEffectBy.bss(ListDescStats)
  return(results)
}

testMeansEffectBy <- function(..., main = NULL, digits = 3) {
  results <- .testMeansEffectBy(...)
  if (is.null(main)) {
    main <- "Hypothesis Test for the Model"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
