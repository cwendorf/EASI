# Estimation Approach to Statistical Inference
## Correlations Difference

### Confidence Intervals

.estimateCorrelationsDifference <- function(x, ...) {
  UseMethod(".estimateCorrelationsDifference")
}

.estimateCorrelationsDifference.list <- function(CorrEst1, CorrEst2, ...) {
  corr1 <- .unformatFrame(CorrEst1[[1]])[1, 1]
  LL1 <- .unformatFrame(CorrEst1[[1]])[1, 3]
  UL1 <- .unformatFrame(CorrEst1[[1]])[1, 4]
  corr2 <- .unformatFrame(CorrEst2[[1]])[1, 1]
  LL2 <- .unformatFrame(CorrEst2[[1]])[1, 3]
  UL2 <- .unformatFrame(CorrEst2[[1]])[1, 4]
  Diff <- corr2 - corr1
  LL <- corr2 - corr1 - sqrt((corr1 - LL1)^2 + (UL2 - corr2)^2)
  UL <- corr2 - corr1 + sqrt((UL1 - corr1)^2 + (corr2 - LL2)^2)
  results <- data.frame(Diff = Diff, LL = LL, UL = UL)
  rownames(results) <- "Difference"
  return(results)
}

estimateCorrelationsDifference <- function(..., main = NULL, digits = 3) {
  results <- .estimateCorrelationsDifference(...)
  if (is.null(main)) {
    main <- "Confidence Interval for the Difference of Correlations"
  }
  results <- .formatList(list(results), main = main, digits = digits)
  return(results)
}

### Confidence Interval Plots

plotCorrelationsDifference <- function(x, ...) {
  UseMethod("plotCorrelationsDifference")
}

plotCorrelationsDifference.list <- function(CorrEst1, CorrEst2, add = FALSE, main = NULL, line = NULL, rope = NULL, ylab = "Correlation", xlab = "", values = TRUE, pos = 2, connect = FALSE, ylim = NULL, digits = 3, pch = 17, col = "black", offset = 0, intervals = TRUE, ...) {
  results <- estimateCorrelationsDifference(CorrEst1, CorrEst2)
  if (is.null(main)) {
    main <- "Confidence Interval for the \n Difference of Correlations"
  }
  plotIntervals(results, add = add, main = main, xlab = xlab, ylab = ylab, ylim = ylim, values = values, line = line, rope = rope, digits = digits, connect = connect, pos = pos, col = col, offset = offset, intervals = intervals)
}
