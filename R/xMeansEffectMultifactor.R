# Estimation Approach to Statistical Inference
## Eta Squared (Multifactor Designs)

### Descriptives

.describeMeansEffectMultifactor <- function(x,...) 
  UseMethod(".describeMeansEffectMultifactor")

.describeMeansEffectMultifactor.default <- function(...,by) {
  x <- .describeMeansOmnibusMultifactor(...,by=by)
  results <- x[[1]]
  results[,2] <- results[,1]/sum(results[,1])
  results[,3] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[length(results[,2]),2:3] <- NA
  results1 <- results[1,2:3]
  colnames(results1) <- c("EtaSq","ParEtaSq")
  results <- x[[2]]
  results[,2] <- results[,1]/sum(results[,1])
  results[,3] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[length(results[,2]),2:3] <- NA
  results2 <- results[1:2,2:3]
  colnames(results2) <- c("EtaSq","ParEtaSq")
  results <- list(results1,results2)
  names(results) <- c("Between Subjects","Within Subjects")
  return(results)
}

.describeMeansEffectMultifactor.formula <- function(formula,by,...) {
  x <- .describeMeansOmnibusMultifactor(formula=formula,by=by)
  results <- x[[1]]
  results[,2] <- results[,1]/sum(results[,1])
  results[,3] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[length(results[,2]),2:3] <- NA
  results <- results[1:3,2:3]
  colnames(results) <- c("EtaSq","ParEtaSq")
  results <- list(results)
  names(results) <- "Between Subjects"
  return(results)
}

describeMeansEffectMultifactor <- function(...,main=NULL,digits=3) {
  results <- .describeMeansEffectMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Proportion of Variance Accounted for by the Effects"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
