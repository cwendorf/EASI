# Estimation Approach to Statistical Inference
## Percentiles

### Descriptives

.describePercentiles <- function(x,...) 
  UseMethod(".describePercentiles")

.describePercentiles.default <- function(...) {
  data <- data.frame(...)
  results <- t(sapply(data,quantile))
  return(results)
}

.describePercentiles.formula <- function(formula) {
  results <- aggregate(formula,FUN=.describePercentiles)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("0%","25%","50%","75%","100%")
  return(results)
}

describePercentiles <- function(...,main=NULL,digits=3) {
  results <- .describePercentiles(...)
  results <- .formatList(list(results),digits=digits)   
  if(is.null(main)) {names(results) <- "Percentiles for the Data"} else {names(results) <- main}  
  return(results)
}
