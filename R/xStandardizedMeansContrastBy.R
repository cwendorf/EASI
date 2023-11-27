# Estimation Approach to Statistical Inference
### Standardized Means Contrast (with By Option))

### Confidence Intervals

.estimateStandardizedMeansContrastBy <- function(x, ...) {
  UseMethod(".estimateStandardizedMeansContrastBy")
}

.estimateStandardizedMeansContrastBy.wss <- function(ListDescStats, ListCorrStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeansContrast.wss(ListDescStats[[i]], ListCorrStats[[i]], contrast = contrast, conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansContrastBy.bss <- function(ListDescStats, contrast, conf.level = .95, ...) {
  results <- NULL
  for (i in seq_along(ListDescStats)) {
    results[[i]] <- .estimateStandardizedMeansContrast.bss(ListDescStats[[i]], contrast = contrast, conf.level = conf.level)
  }
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateStandardizedMeansContrastBy.default <- function(frame, by, contrast, conf.level = .95, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  ListDescStats <- .describeSummaryBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateStandardizedMeansContrastBy.wss(ListDescStats, ListCorrStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

.estimateStandardizedMeansContrastBy.formula <- function(formula, by, contrast, conf.level = .95, ...) {
  ListDescStats <- .describeSummaryBy(formula, by = by)
  results <- .estimateStandardizedMeansContrastBy.bss(ListDescStats, contrast = contrast, conf.level = conf.level)
  return(results)
}

estimateStandardizedMeansContrastBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateStandardizedMeansContrastBy(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Standardized Contrast of Means"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
