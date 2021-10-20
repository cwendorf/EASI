# Estimation Approach to Statistical Inference
## Frequencies

### Descriptives

.describeFrequencies <- function(x,main=NULL,digits=3) {
  Freq=table(x)
  Perc=prop.table(table(x))
  CumFreq=cumsum(table(x))
  CumPerc=cumsum(table(x))/summary(table(x))[[2]]
  results <- cbind(Freq,Perc,CumFreq,CumPerc)
  results <- .formatList(list(results),digits=digits)
  if(is.null(main)) {names(results) <- "Frequency Distribution for the Data"} else {names(results) <- main}  
}

describeFrequencies <- function(x,...) 
  UseMethod("describeFrequencies")

describeFrequencies.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- lapply(data,.describeFrequencies,main=main,digits=digits)
  results <- unlist(results,recursive=FALSE)
  return(results)
}

describeFrequencies.formula <- function(formula,main=NULL,digits=3) {
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  results <- tapply(outcome,group,FUN=.describeFrequencies,simplify=FALSE)
  results <- unlist(results,recursive=FALSE)  
  return(results)
}
