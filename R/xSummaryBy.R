# Estimation Approach to Statistical Inference
## Summary Statistics (with By Option)

#### Descriptives

.describeSummaryBy <- .describeMeansBy <- function(x, ...) {
  UseMethod(".describeMeansBy")
}

.describeSummaryBy.default <- .describeMeansBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  MixedData <- data.frame(by, data)
  SplitData <- split(MixedData[-1], by)
  results <- lapply(SplitData, .describeSummary)
  return(results)
}

.describeSummaryBy.formula <- .describeMeansBy.formula <- function(formula, by, ...) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  FactorialData <- data.frame(by, Group, Outcome)
  SplitData <- split(FactorialData, by)
  results <- lapply(SplitData, function(x) with(x, .describeSummary(Outcome ~ Group)))
  return(results)
}

describeSummaryBy <- describeMeansBy <- function(..., main = NULL, digits = 3) {
  results <- .describeSummaryBy(...)
  if (is.null(main)) {
    main <- "Summary Statistics for the Data"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main, digits = digits)
  return(results)
}
