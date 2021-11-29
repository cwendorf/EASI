# Estimation Approach to Statistical Inference
## Eta Squared (Multifactor Designs)

### Helper

.ciEta <- function(F,dff,dfe,etasq,conf.level) {
  delta.lower <- delta.upper <- numeric(length(etasq))
  delta.lower <- try(.ncpF(F,dff,dfe,prob=(1+conf.level)/2),silent=TRUE)
  delta.upper <- try(.ncpF(F,dff,dfe,prob=(1-conf.level)/2),silent=TRUE)
  if(is.character(delta.lower)) {delta.lower <- 0}
  etasq.lower <- delta.lower / (delta.lower + dff + dfe + 1)
  etasq.upper <- delta.upper / (delta.upper + dff + dfe + 1)
  results <- cbind(Est=etasq,LL=etasq.lower,UL=etasq.upper)
  results
}

### Confidence Intervals

.estimateMeansEffectMultifactor <- function(x,...) 
  UseMethod(".estimateMeansEffectMultifactor")

.estimateMeansEffectMultifactor.wss <- function(ListDescStats,ListCorrStats,conf.level=.90) {
  x <- .describeMeansOmnibusMultifactor.wss(ListDescStats,ListCorrStats)
  results <- cbind(x[[1]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level)
  results1 <- results
  results <- cbind(x[[2]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)  
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level)
  results[2,5:7] <- .ciEta(results[2,4],results[2,2],tail(results[,2],1),results[2,5],conf.level)
  results2 <- results
  results <- list(results1,results2)
  names(results) <- c("Between Subjects","Within Subjects")
  results[[1]]=rbind(results[[1]][-2,5:7])
  rownames(results[[1]])="Blocks"
  results[[2]]=as.data.frame(results[[2]][-3,5:7])
  return(results)
}

.estimateMeansEffectMultifactor.bss <- function(ListDescStats,conf.level=.90) {
  x <- .describeMeansOmnibusMultifactor.bss(ListDescStats)
  results <- cbind(x[[1]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level)
  results[2,5:7] <- .ciEta(results[2,4],results[1,2],tail(results[,2],1),results[2,5],conf.level)
  results[3,5:7] <- .ciEta(results[3,4],results[1,2],tail(results[,2],1),results[3,5],conf.level)
  results <- list(results[-4,5:7])
  names(results) <- "Between Subjects"
  return(results)
}

.estimateMeansEffectMultifactor.default <- function(...,by,conf.level=.90) {
  ListDescStats <- .describeMeansBy.default(...,by=by)
  ListCorrStats <- .describeCorrelationsBy.default(...,by=by)
  .estimateMeansEffectMultifactor.wss(ListDescStats,ListCorrStats,conf.level)
}

.estimateMeansEffectMultifactor.formula <- function(formula,by,conf.level=.90) {
  ListDescStats <- .describeMeansBy.formula(formula,by=by)
  .estimateMeansEffectMultifactor.bss(ListDescStats,conf.level)
}

estimateMeansEffectMultifactor <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansEffectMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Proportion of Variance Accounted"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
