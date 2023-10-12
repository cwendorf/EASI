# Estimation Approach to Statistical Inference
## Mean Omnibus Analyses (with By Option)

### Descriptives

.describeMeansOmnibusBy <- function(x, ...)
  UseMethod(".describeMeansOmnibusBy")

.describeMeansOmnibusBy.wss <- function(ListDescStats, ListCorrStats, ...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansOmnibus.wss(ListDescStats[[i]], ListCorrStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansOmnibusBy.bss <- function(ListDescStats, ...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .describeMeansOmnibus.bss(ListDescStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.describeMeansOmnibusBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)  
  results <- .describeMeansOmnibusBy.wss(ListDescStats, ListCorrStats)
  return(results)
}

.describeMeansOmnibusBy.formula <- function(formula, by, ...) {
  ListDescStats <- .describeMeansBy(formula, by = by)
  results <- .describeMeansOmnibusBy.bss(ListDescStats)
  return(results)
}

describeMeansOmnibusBy <- function(..., main = NULL, digits = 3) {
  results <- .describeMeansOmnibusBy(...)
  if (is.null(main)) {main <- "Source Table for the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Intervals

.estimateMeansOmnibusBy <- function(x, ...)
  UseMethod(".estimateMeansOmnibusBy")

.estimateMeansOmnibusBy.wss <- function(ListDescStats, ListCorrStats, conf.level = .90, ...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeansOmnibus.wss(ListDescStats[[i]], ListCorrStats[[i]], conf.level)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansOmnibusBy.bss <- function(ListDescStats, conf.level = .90, ...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .estimateMeansOmnibus.bss(ListDescStats[[i]], conf.level)}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.estimateMeansOmnibusBy.default <- function(frame, by, conf.level = .90, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .estimateMeansOmnibusBy.wss(ListDescStats, ListCorrStats, conf.level)
  return(results)
}

.estimateMeansOmnibusBy.formula <- function(formula, by, conf.level = .90, ...) {
  ListDescStats <- .describeMeansBy(formula, by = by)
  results <- .estimateMeansOmnibusBy.bss(ListDescStats, conf.level)
  return(results)
}

estimateMeansOmnibusBy <- function(..., main = NULL, digits = 3) {
  results <- .estimateMeansOmnibusBy(...)
  if (is.null(main)) {main <- "Proportion of Variance Accounted For by the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibusBy <- function(x, ...)
  UseMethod(".testMeansOmnibusBy")

.testMeansOmnibusBy.wss <- function(ListDescStats, ListCorrStats, ...) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeansOmnibus.wss(ListDescStats[[i]], ListCorrStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansOmnibusBy.bss <- function(ListDescStats) {
  results <- NULL
  for (i in 1:length(ListDescStats)) {results[[i]] <- .testMeansOmnibus.bss(ListDescStats[[i]])}
  names(results) <- names(ListDescStats)
  class(results) <- NULL
  return(results)
}

.testMeansOmnibusBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy(data, by = by)
  ListCorrStats <- .describeCorrelationsBy(data, by = by)
  results <- .testMeansOmnibusBy.wss(ListDescStats, ListCorrStats)
  return(results)
}

.testMeansOmnibusBy.formula <- function(formula, by, ...) {
  ListDescStats <- .describeMeansBy(formula, by = by)
  results <- .testMeansOmnibusBy.bss(ListDescStats)
  return(results)
}

testMeansOmnibusBy <- function(..., main = NULL, digits = 3) {
  results <- .testMeansOmnibusBy(...)
  if (is.null(main)) {main <- "Hypothesis Test for the Model"}
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
