# Estimation Approach to Statistical Inference
## Functions for Mean Special Contrasts

### Confidence Interval Functions

.easiMeanSpecial <- function(...,contrast1,contrast2,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  res1 <- .unformatFrame(estimateMeanContrast(...,contrast=contrast1,conf.level=conf.level)[[1]])
  res2 <- .unformatFrame(estimateMeanContrast(...,contrast=contrast2,conf.level=conf.level)[[1]])
  results <- rbind(res1,res2)
  if(is.null(labels)) {rownames(results) <- c("Contrast1","Contrast2")} else {rownames(results) <- labels}
  results <- .formatList(list(results),digits=digits)
  names(results) <- "Confidence Intervals for the Mean Contrasts"
  return(results)
}

estimateMeansSpecial <- estimateMeanSpecial <- function(x,...) 
  UseMethod("estimateMeanSpecial")

estimateMeanSpecial.default <- estimateMeanSpecial.formula <- estimateMeanSpecial.wss <- estimateMeanSpecial.bss <- function(...,contrast1,contrast2,conf.level=.95,labels=NULL,main=NULL,digits=3) {
  Specials <- .easiMeanSpecial(...,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,digits=digits)
  contrast <- contrast2-contrast1
  Diff <- estimateMeanContrast(...,contrast=contrast,conf.level=conf.level,digits=digits)
  results <- c(Specials,Diff)
  return(results)
}

### Confidence Interval Plot Functions

plotMeansSpecial <- plotMeanSpecial <- function(x,...) 
  UseMethod("plotMeanSpecial")

plotMeanSpecial.wss <- function(CompStats,CorrStats,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSpecial(CompStats,CorrStats,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Contrast")
}

plotMeanSpecial.bss <- function(CompStats,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSpecial(CompStats,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Constrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Contrast")
}

plotMeanSpecial.default <- function(...,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSpecial(...,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=TRUE,slab="Mean Contrast")
}

plotMeanSpecial.formula <- function(formula,contrast1,contrast2,main=NULL,ylab="Mean Contrasts",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,ylim=NULL,digits=3) {
  results <- estimateMeanSpecial(formula,contrast1=contrast1,contrast2=contrast2,conf.level=conf.level,labels=labels,main=main,digits=digits)
  results <- rbind(.unformatFrame(results[[1]][,c(1,4,5)]),.unformatFrame(results[[2]][,c(1,4,5)]))
  if(is.null(main)) {main="Confidence Intervals for the \n Mean Contrasts"}
  .cipComp(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,ylim=ylim,digits=digits,connect=FALSE,slab="Mean Contrast")
}
