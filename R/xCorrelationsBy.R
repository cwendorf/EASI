# Estimation Approach to Statistical Inference
## Correlations By

### Descriptives

.describeCorrelationsBy <- function(x, ...) {
  UseMethod(".describeCorrelationsBy")
}

.describeCorrelationsBy.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  MixedData <- data.frame(by, data)
  SplitData <- split(MixedData[-1], by)
  results <- lapply(SplitData, .describeCorrelations)
  return(results)
}

.describeCorrelationsBy.corr <- function(list, ...) {
  results <- lapply(list, .describeCorrelations.corr)
  return(results)
}

describeCorrelationsBy <- function(..., main = NULL, digits = 3) {
  results <- .describeCorrelationsBy(...)
  if (is.null(main)) {
    main <- "Correlation Matrix for the Variables"
  }
  main <- paste(main, names(results), sep = ": ")
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}
