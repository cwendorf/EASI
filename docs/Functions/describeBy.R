# Estimation Approach to Statistical Inference
## Extension for Analyzing Factorial and Mixed Designs

### Data Functions

#### Describe Function for Mutiple Groups and Variables

descDataBy <- function(...) 
  UseMethod("descDataBy")

descDataBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,descData)
  return(results)
}

descDataBy.formula <- function(formula,by) {
  model <- model.frame(formula)
  FactorialData <- cbind(by,model[2],model[1])
  SplitData <- split(FactorialData[-1],by)
  results <- lapply(SplitData,descData.formula,formula=formula)
  return(results)
}

describeDataBy <- function(...,digits=3) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE DATA\n\n")
  print(lapply(descDataBy(...),formatFrame,digits=digits))
}

#### Correlate/Covary Functions for Mutiple Variables

corrDataBy <- function(...) 
  UseMethod("corrDataBy")

corrDataBy.default <- function(...,by) {
  MixedData <- data.frame(by,...)
  SplitData <- split(MixedData[-1],by)
  results <- lapply(SplitData,corrData)
  return(results)
}

correlateLevelsBy <- function(...,digits=3) {
  cat("\nCORRELATION MATRIX FOR THE LEVELS\n\n")
  print(corrDataBy(...))
  print(lapply(corrDataBy(...),formatFrame,digits=digits))
}
