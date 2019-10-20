# Estimation Approach to Statistical Inference (EASI)
## Extension for Data and Plots
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R
### ALL BASIC FUNCTIONS FOR EASI SHOULD BE INSTALLED TOO

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

plotData <- function(...) 
  UseMethod("plotData")

plotData.default <- function(...,method="jitter",col="gray60") {
  main="Boxplots for the Data"
  ylab="Outcome"
  xlab="Variables"
  data <- data.frame(...)
  par(bty="l")
  boxplot(data,boxwex=.15,xlab="",ylab=ylab,main=main)
  mx <- ncol(data)+.25
  mn <- 1+.25
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}  

plotData.formula <- function(formula,method="jitter",col="gray60",...) {
  main="Boxplots for the Data"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  par(bty="l")
  boxplot(formula,boxwex=.15,xlab="",ylab=ylab,main=main)
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.25
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=16,col=col)
}
