# Estimation Approach to Statistical Inference
## Format

### Frames

.formatFrame <- function(results, digits = 3) {
  format(as.data.frame(round(results, digits = digits)), width = 7, trim = TRUE, nsmall = digits)
}

.unformatFrame <- function(results) {
  apply(results, c(1, 2), FUN = as.numeric)
}

.pivotFrame <- function(results) {
  out <- t(.unformatFrame(results))
  .formatFrame(out)
}

### Split Data

.splitData <- function(x, ...) {
  UseMethod(".splitData")
}

.splitData.default <- function(frame, by, ...) {
  data <- data.frame(frame)
  if (ncol(data) == 1) {
    colnames(data) <- deparse(substitute(frame))
  }
  MixedData <- data.frame(by, data)
  SplitData <- split(MixedData[-1], by)
  return(SplitData)
}

.splitData.formula <- function(formula, by, ...) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  FactorialData <- data.frame(by, Group, Outcome)
  SplitData <- split(FactorialData[-1], by)
  return(SplitData)
}

### Lists

.formatList <- function(results, main = NULL, digits = 3) {
  results <- lapply(results, .formatFrame, digits)
  names(results) <- main
  results
}

.unformatList <- function(results) {
  lapply(results, .unformatFrame)
}

.deList <- function(results) {
  out <- results[[1]]
  colnames(out)[1] <- "Est"
  if (length(results) > 1) {
    for (i in 2:length(results)) {
      colnames(results[[i]])[1] <- "Est"
      out <- rbind(out, results[[i]])
    }
  }
  return(out)
}

.collapseList <- function(results, main = NULL) {
  if (is.null(main)) {
    main <- names(results)[2]
  } else {
    main <- main
  }
  out <- list(.deList(results))
  names(out) <- main
  return(out)
}

.pivotList <- function(results) {
  main <- names(results)
  out <- .unformatList(results)
  out <- lapply(out, t)
  .formatList(out, main = main)
}
