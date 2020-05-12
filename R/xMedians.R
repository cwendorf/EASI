# Estimation Approach to Statistical Inference
## Functions for Medians and Boxplots

### Descriptive Functions

#### Describe Function for Medians

.descMedians <- function(x,...)
  UseMethod(".descMedians")

.descMedians.default <- function(...) {
  data <- data.frame(...)
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  results <- round(results,3)
  colnames(results) <- c("Lower Whisker","Lower Hinge","Median","Upper Hinge","Upper Whisker")
  return(results)
}

.descMedians.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=.descMedians,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("Lower Whisker","Lower Hinge","Median","Upper Hinge","Upper Whisker")
  return(results)
}

describeMedians <- function(...,main=NULL,digits=3) {
  results <- .formatList(list(.descMedians(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}
  return(results)
}

### Plot Functions

#### Boxplot Functions

plotBoxes <- function(x,...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,main=NULL,ylab="Outcome",xlab="") {
  if(is.null(main)) {main="Boxplots for the Variables"}
  data <- data.frame(...)
  par(bty="l")
  boxplot(data,boxwex=.15,cex=1.5,cex.lab=1.3,xlab=xlab,ylab=ylab,main=main,...)
}  

plotBoxes.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",...) {
  if(is.null(main)) {main="Boxplots for the Groups"}
  par(bty="l")
  boxplot(formula,boxwex=.15,cex=1.5,cex.lab=1.3,xlab=xlab,ylab=ylab,main=main,...)
}
