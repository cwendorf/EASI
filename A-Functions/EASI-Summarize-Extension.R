# Estimation Approach to Statistical Inference
## Extension for Data Summaries and Plots

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 
### ALSO: PASTE CONTENTS OF EASI-FUNCTIONS INTO R

### Data Functions

#### Summary Functions

summData <- function(...)
  UseMethod("summData")

summData.default <- function(...) {
  data <- data.frame(...)
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  results <- round(results,3)
  colnames(results) <- c("Lower Whisker","Lower Hinge","Median","Upper Hinge","Upper Whisker")
  return(results)
}

summData.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=summData,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("Lower Whisker","Lower Hinge","Median","Upper Hinge","Upper Whisker")
  return(results)
}

summarizeData <- function(...) {
  cat("\nSUMMARY STATISTICS FOR THE DATA\n\n")
   print(summData(...))
  cat("\n")
}

#### Plot Functions for Boxes and Data

plotBoxes <- function(...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...) {
  main="Boxplots for the Data"
  ylab="Outcome"
  xlab="Variables"
  data <- data.frame(...)
  par(bty="l")
  boxplot(data,boxwex=.15,xlab="",ylab=ylab,main=main,...)
}  

plotBoxes.formula <- function(formula,...) {
  main="Boxplots for the Data"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  par(bty="l")
  boxplot(formula,boxwex=.15,xlab="",ylab=ylab,main=main,...)
}
