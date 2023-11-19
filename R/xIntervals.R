# Estimation Approach to Statistical Inference
## Intervals

### Confidence Intervals

estimateIntervals <- function(x, contrast = NULL, ...) {
  howmany <- nrow(.describeSummary(x))
  if (!is.null(contrast)) {
    estimateMeanSubsets(x, contrast = contrast, ...)
  } else if (howmany == 2) {
    estimateMeanComparison(x, ...)
  } else {
    estimateMeans(x, ...)
  }
}

### Confidence Interval Plot

plotIntervals <- function(x, ...) {
  UseMethod("plotIntervals")
}

plotIntervals.default <- function(x, contrast = NULL, ...) {
  howmany <- nrow(.estimateMeans(x))
  if (!is.null(contrast)) {
    plotMeanSubsets(x, contrast = contrast, ...)
  } else if (howmany == 2) {
    plotMeanComparison(x, ...)
  } else {
    plotMeans(x, ...)
  }
  invisible(eval(x))
}

plotIntervals.list <- function(results, add = FALSE, ...) {
  out <- results
  if (length(results) == 1) {
    results[[1]] <- results[[1]][, c(1, (ncol(results[[1]]) - 1):ncol(results[[1]]))]
    if (!add) .plotMain(results, ...)
    .intervalsMain(results, ...)
  }
  if (length(results) == 2 && nrow(results[[1]] != nrow(results[[2]]))) {
    results <- .collapseList(results)
    results[[1]] <- results[[1]][, c(1, (ncol(results[[1]]) - 1):ncol(results[[1]]))]
    if (!add) .plotComp(results, ...)
    .intervalsComp(results, ...)
  }
  invisible(out)
}

addIntervals <- function(...) {
  plotIntervals(..., add = TRUE)
}
