# Estimation Approach to Statistical Inference
## Percentiles

### Describe

describePercentiles <- function(x, ...) {
  UseMethod("describePercentiles")
}

describePercentiles.data.frame <- function(frame, ...) {
  data <- data.frame(frame)
  results <- t(sapply(data, quantile))
  colnames(results) <- c("Min", "25%", "50%", "75%", "Max")
  class(results) <- "easi.frame"
  comment(results) <- "Percentiles for the Data"
  return(results)
}

describePercentiles.formula <- function(formula, ...) {
  results <- aggregate(formula, FUN = describePercentiles.data.frame)
  rn <- results[, 1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("Min", "25%", "50%", "75%", "Max")
  class(results) <- "easi.frame"
  comment(results) <- "Percentiles for the Data"
  return(results)
}
