# Estimation Approach to Statistical Inference
## Percentiles

### Descriptives

.describePercentiles <- function(x,...)
  UseMethod(".describePercentiles")

.describePercentiles.default <- function(frame,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  results <- t(sapply(data,quantile))
  colnames(results) <- c("Min","25%","50%","75%","Max")
  return(results)
}

.describePercentiles.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=.describePercentiles)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("Min","25%","50%","75%","Max")
  return(results)
}

describePercentiles <- function(...,main=NULL,digits=3) {
  results <- .describePercentiles(...)
  if(is.null(main)) {main <- "Percentiles for the Data"}
  results <- .formatList(list(results),main=main,digits=digits)
  return(results)
}
