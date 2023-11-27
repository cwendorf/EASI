# Estimation Approach to Statistical Inference
## Standardized Means Difference (with By Option)

### Confidence Intervals

.estimateStandardizedMeansDifferenceBy <- function(x, ...) {
  UseMethod(".estimateStandardizedMeansDifferenceBy")
}

.estimateStandardizedMeansDifferenceBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeansDifference.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansDifferenceBy.bss <- function(ListDescStats, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeansDifference.bss(ListDescStats[[i]], conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansDifferenceBy.default <- function(frame, by, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateStandardizedMeansDifferenceBy.wss(ListDescStats, ListCorrStats, conf.level = conf.level)
  return(results)
}

.estimateStandardizedMeansDifferenceBy.formula <- function(formula, by, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateStandardizedMeansDifferenceBy.bss(ListDescStats, conf.level = conf.level)
  return(results)
}

estimateStandardizedMeansDifferenceBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeansDifferenceBy(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Standardized Difference of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
