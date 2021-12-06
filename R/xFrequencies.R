# Estimation Approach to Statistical Inference
## Frequencies

### Descriptives

.frequencies <- function(x) {
  Freq <- table(x)
  Perc <- prop.table(table(x))
  CumFreq <- cumsum(table(x))
  CumPerc <- cumsum(table(x))/summary(table(x))[[2]]
  results <- cbind(Freq,Perc,CumFreq,CumPerc)
  return(results)  
}

.describeFrequencies <- function(x,...) 
  UseMethod(".describeFrequencies")

.describeFrequencies.default <- function(...) {
  data <- data.frame(...)
  results <- lapply(data,FUN=.frequencies)
  return(results)
}

.describeFrequencies.formula <- function(formula) {
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  results <- tapply(outcome,group,FUN=.frequencies)
  return(results)
}

describeFrequencies <- function(...,main=NULL,digits=3) {
  results <- .describeFrequencies(...) 
  if(is.null(main)) {main <- "Frequency Distribution for the Data"} 
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
