# Estimation Approach to Statistical Inference
## Correlations Comparison

### Confidence Intervals

.estimateCorrelationsComparison <- function(x, ...) {
  UseMethod(".estimateCorrelationsComparison")
}

.estimateCorrelationsComparison.list <- function(CorrEst1, CorrEst2, labels = NULL, ...) {
  Est1 <- .unformatFrame(CorrEst1[[1]])
  Est2 <- .unformatFrame(CorrEst2[[1]])
  Corrs <- rbind(Est1, Est2)
  if (is.null(labels)) {
    rownames(Corrs) <- c("Correlation 1", "Correlation 2")
  } else {
    rownames(Corrs) <- labels
  }
  Corrs <- list(Corrs)
  names(Corrs) <- "Confidence Intervals for the Correlations"
  Diff <- .estimateCorrelationsDifference(CorrEst1, CorrEst2)
  Diff <- list(Diff)
  names(Diff) <- "Confidence Interval for the Difference of Correlations"
  results <- c(Corrs, Diff)
  return(results)
}

estimateCorrelationsComparison <- function(..., main = NULL, digits = 3) {
  results <- .estimateCorrelationsComparison(...)
  if (is.null(main)) {
    main <- names(results)
  }
  results <- .formatList(results, main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotCorrelationsComparison <- function(x, ...) {
  UseMethod("plotCorrelationsComparison")
}

plotCorrelationsComparison.list <- function(CorrEst1, CorrEst2, add = FALSE, main = NULL, ylab = "Correlation", xlab = "", rope = NULL, labels = NULL, pos = c(2, 2, 4), connect = FALSE, values = TRUE, ylim = NULL, digits = 3, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateCorrelationsComparison(CorrEst1, CorrEst2, main = main, labels = labels, digits = digits)
  results[[1]] <- results[[1]][, c(1, 3, 4)]
  if (is.null(main)) {
    main <- "Confidence Intervals for the \n Comparison of Correlations"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
}
