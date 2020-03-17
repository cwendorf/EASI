# Estimation Approach to Statistical Inference
## Extension for Data Summaries and Plots

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

summarizeData <- function(...,main=NULL,digits=3) {
  results <- formatList(list(summData(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Summary Statistics for the Data"} else {names(results) <- main}
  return(results)
}

#### Plot Functions for Boxes and Data

plotBoxes <- function(...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,main=NULL,ylab="Outcome",xlab="") {
  if(is.null(main)) {main="Boxplots for the Data"}
  data <- data.frame(...)
  par(bty="l")
  boxplot(data,boxwex=.15,cex=1.5,cex.lab=1.3,xlab=xlab,ylab=ylab,main=main,...)
}  

plotBoxes.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",...) {
  if(is.null(main)) {main="Boxplots for the Data"}
  par(bty="l")
  boxplot(formula,boxwex=.15,cex=1.5,cex.lab=1.3,xlab=xlab,ylab=ylab,main=main,...)
}
