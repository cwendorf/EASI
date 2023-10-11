# Estimation Approach to Statistical Inference
## Eta Squared (Multifactor Designs)

### Confidence Intervals

.estimateMeansEffectMultifactor <- function(x,...)
  UseMethod(".estimateMeansEffectMultifactor")

.estimateMeansEffectMultifactor.wss <- function(ListDescStats,ListCorrStats,conf.level=.90,...) {
  x <- .describeMeansOmnibusMultifactor.wss(ListDescStats,ListCorrStats)
  results <- cbind(x[[1]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta2(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level=conf.level)
  results1 <- results
  results <- cbind(x[[2]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)  
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta2(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level=conf.level)
  results[2,5:7] <- .ciEta2(results[2,4],results[2,2],tail(results[,2],1),results[2,5],conf.level=conf.level)
  results2 <- results
  results <- list(results1,results2)
  names(results) <- c("Between Subjects","Within Subjects")
  results[[1]]=rbind(results[[1]][-2,5:7])
  rownames(results[[1]])="Blocks"
  results[[2]]=as.data.frame(results[[2]][-3,5:7])
  return(results)
}

.estimateMeansEffectMultifactor.bss <- function(ListDescStats,conf.level=.90,...) {
  x <- .describeMeansOmnibusMultifactor.bss(ListDescStats)
  results <- cbind(x[[1]],F=NA,Est=NA,LL=NA,UL=NA)
  results[,4] <- results[,3]/tail(results[,3],1)
  results[,5] <- results[,1]/(results[,1]+tail(results[,1],1))
  results[1,5:7] <- .ciEta2(results[1,4],results[1,2],tail(results[,2],1),results[1,5],conf.level=conf.level)
  results[2,5:7] <- .ciEta2(results[2,4],results[1,2],tail(results[,2],1),results[2,5],conf.level=conf.level)
  results[3,5:7] <- .ciEta2(results[3,4],results[1,2],tail(results[,2],1),results[3,5],conf.level=conf.level)
  results <- list(results[-4,5:7])
  names(results) <- "Between Subjects"
  return(results)
}

.estimateMeansEffectMultifactor.default <- function(frame,by,conf.level=.90,...) {
  data <- data.frame(frame)
  if(ncol(data)==1) {colnames(data) <- deparse(substitute(frame))}
  ListDescStats <- .describeMeansBy.default(data,by=by)
  ListCorrStats <- .describeCorrelationsBy.default(data,by=by)
  .estimateMeansEffectMultifactor.wss(ListDescStats,ListCorrStats,conf.level=conf.level)
}

.estimateMeansEffectMultifactor.formula <- function(formula,by,conf.level=.90,...) {
  ListDescStats <- .describeMeansBy.formula(formula,by=by)
  .estimateMeansEffectMultifactor.bss(ListDescStats,conf.level=conf.level)
}

estimateMeansEffectMultifactor <- function(...,main=NULL,digits=3) {
  results <- .estimateMeansEffectMultifactor(...)
  if(is.null(main)) {main <- "Proportion of Variance Accounted For"}
  main <- paste(main,names(results),sep=": ")
  results <- .formatList(results,main=main,digits=digits)
  return(results)
}
