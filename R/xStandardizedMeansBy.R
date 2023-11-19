# Estimation Approach to Statistical Inference
## Standardized Means (with By Option)

### Confidence Intervals

.estimateStandardizedMeansBy <- function(x, ...) {
  UseMethod(".estimateStandardizedMeansBy")
}

.estimateStandardizedMeansBy.wss <- function(ListDescStats, conf.level = .95, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeans.wss(ListDescStats[[i]], conf.level = conf.level, mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansBy.bss <- function(ListDescStats, conf.level = .95, mu = 0, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeans.bss(ListDescStats[[i]], conf.level = conf.level, mu = mu)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansBy.default <- function(frame, by, mu = 0, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(frame, by = by)
  results <- .estimateStandardizedMeansBy.wss(ListDescStats, mu = mu, conf.level = conf.level)
  return(results)
}

.estimateStandardizedMeansBy.formula <- function(formula, by, mu = 0, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateStandardizedMeansBy.bss(ListDescStats, mu = mu, conf.level = conf.level)
  return(results)
}

estimateStandardizedMeansBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeansBy(...)
  if (is.null(main)) {
    main <- "Confidence Intervals for the Standardized Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
