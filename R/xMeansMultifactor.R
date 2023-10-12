# Estimation Approach to Statistical Inference
## Means (Multifactor Designs)

### Confidence Interval Plots

plotMeansMultifactor <- function(..., by, main = NULL, ylab = "Outcome", xlab = "", conf.level = .95, col = "black") {
  results <- .estimateMeansBy(..., by = by, conf.level = conf.level)
  if (is.null(main)) {main <- "Confidence Intervals for the Means"}
  .intervalsMulti(results, main = main, ylab = ylab, xlab = xlab, col = col)
  invisible(eval(...))
}
