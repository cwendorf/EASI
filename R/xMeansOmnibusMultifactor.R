# Estimation Approach to Statistical Inference
## Mean Omnibus Analysis (Multifactor Designs)

### Descriptives

.describeMeansOmnibusMultifactor <- function(x,...) 
  UseMethod(".describeMeansOmnibusMultifactor")

.describeMeansOmnibusMultifactor.default <- function(...,by) {
  data <- data.frame(...)
  columns <- dim(data)[2]
  data <- data.frame(...,Factor=by)
  dataLong <- reshape(data,varying=1:columns,v.names="Outcome",timevar="Measures",idvar="Subjects",direction="long")
  dataLong$Subjects <- as.factor(dataLong$Subjects)
  dataLong$Measures <- as.factor(dataLong$Measures)
  dataLong$Factor <- as.factor(dataLong$Factor)
  object <- aov(Outcome~Factor+(Measures*Factor)+Error(Subjects/Measures),data=dataLong)
  w <- summary(object)
  x <- w[[1]][[1]]
  results1 <- cbind(x[2],x[1],x[3])
  colnames(results1) <- c("SS","df","MS")
  y <- w[[2]][[1]]
  results2 <- cbind(y[2],y[1],y[3])
  colnames(results2) <- c("SS","df","MS")
  results <- list(results1,results2)
  names(results) <- c("Between Subjects","Within Subjects")
  return(results)
}

.describeMeansOmnibusMultifactor.formula <- function(formula,by,...) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  Factor <- by
  object <- aov(Outcome~Group+Factor+(Group*Factor))
  x <- summary(object)[[1]]
  results <- cbind(x[2],x[1],x[3])
  colnames(results) <- c("SS","df","MS")
  results <- list(results)
  names(results) <- "Between Subjects"
  return(results)
}

describeMeansOmnibusMultifactor <- function(...,main=NULL,digits=3) {
  results <- .describeMeansOmnibusMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Source Table for the Effects"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibusMultifactor <- function(x,...) 
  UseMethod(".testMeansOmnibusMultifactor")

.testMeansOmnibusMultifactor.default <- function(...,by) {
  data <- data.frame(...)
  columns <- dim(data)[2]
  data <- data.frame(...,Factor=by)
  dataLong <- reshape(data,varying=1:columns,v.names="Outcome",timevar="Measures",idvar="Subjects",direction="long")
  dataLong$Subjects <- as.factor(dataLong$Subjects)
  dataLong$Measures <- as.factor(dataLong$Measures)
  dataLong$Factor <- as.factor(dataLong$Factor)
  object <- aov(Outcome~Factor+(Measures*Factor)+Error(Subjects/Measures),data=dataLong)
  w <- summary(object)
  x <- w[[1]][[1]]
  results1 <- cbind(x[4],x[5])
  results1 <- results1[1,]
  colnames(results1) <- c("F","p")
  y <- w[[2]][[1]]
  results2 <- cbind(y[4],y[5])
  results2 <- results2[1:2,]
  colnames(results2) <- c("F","p")
  results <- list(results1,results2)
  names(results) <- c("Between Subjects","Within Subjects")
  return(results)
}

.testMeansOmnibusMultifactor.formula <- function(formula,by,...) {
  Group <- eval(formula[[3]])
  Outcome <- eval(formula[[2]])
  Factor <- by
  object <- aov(Outcome~Group+Factor+(Group*Factor))
  x <- summary(object)[[1]]
  results <- cbind(x[4],x[5])
  results <- results[1:3,]
  colnames(results) <- c("F","p")
  results <- list(results)
  names(results) <- "Between Subjects"
  return(results)
}

testMeansOmnibusMultifactor <- function(...,main=NULL,digits=3) {
  results <- .testMeansOmnibusMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Hypothesis Tests for the Effects"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
