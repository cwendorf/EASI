# Estimation Approach to Statistical Inference
## Functions for Boxplots

### Descriptive Functions

describeBoxes <- function(x,...)
  UseMethod("describeBoxes")

describeBoxes.default <- function(...,main=NULL,digits=3) {
  data <- data.frame(...)
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  colnames(results) <- c("Min","LQ","Mdn","UQ","Max")
  results <- .formatList(list(results),digits=digits)  
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

describeBoxes.formula <- function(formula,main=NULL,digits=3) {
  results <- aggregate(formula,FUN=describeBoxes)
  rn <- results[,1]
  results <- Reduce(rbind,results[[2]])
  rownames(results) <- rn
  results <- list(results)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}  
  return(results)
}

### Plot Functions

.bp <- function(var,loc,offset=0,scale=.6,border="black",col="white") {
  z <- .unformatFrame(describeBoxes(var)[[1]])
  arrows(loc+offset,z[1],loc+offset,z[5],length=0,lty=2,col=border)
  rect(loc+offset-.03,z[2],loc+offset+.03,z[4],border=border,col=col,lwd=1)
  arrows(loc+offset-.03,z[3],loc+offset+.03,z[3],length=0,lwd=2,col=border)
  arrows(loc+offset-.02,z[1],loc+offset+.02,z[1],length=0,lwd=1,col=border)
  arrows(loc+offset-.02,z[5],loc+offset+.02,z[5],length=0,lwd=1,col=border)
}

.halfbp <- function(var,loc,offset=0,scale=.6,border="black",col="white") {
  z <- .unformatFrame(describeBoxes(var)[[1]])
  arrows(loc+offset,z[1],loc+offset,z[5],length=0,lty=2,col=border)
  rect(loc,z[2],loc+offset+.03,z[4],border=border,col=col,lwd=1)
  arrows(loc,z[3],loc+offset+.03,z[3],length=0,lwd=2,col=border)
  arrows(loc,z[1],loc+offset+.02,z[1],length=0,lwd=1,col=border)
  arrows(loc,z[5],loc+offset+.02,z[5],length=0,lwd=1,col=border)
}

.bpvalues <- function(var,loc,offset=0,col="black") {
  z <- .unformatFrame(describeBoxes(var)[[1]])
  for (i in 1:ncol(z)) text(loc+offset,z[i],z[i],cex=.8,col=col)  
}

plotBoxes <- function(x,...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col="white") {
  if(is.null(main)) {main="Boxplots for the Variables"}
  data <- data.frame(...)
  vars <- colnames(data)
  nvars <- length(data)
  if(!add) {  
  if(is.null(ylim)) {
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:nvars,vars)}
  for(i in 1:nvars) {.bp(data[,i],i,offset=offset,scale=scale,border=border,col=col)}  
} 

plotBoxes.formula <- function(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col="white") {
  if(is.null(main)) {main="Boxplots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  groups <- levels(group)
  ngroups <- nlevels(group)
  if(!add) {
  if(is.null(ylim)) {
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.15)
  axis(1,1:ngroups,groups)}
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.bp(outcome,i,offset=offset,scale=scale,border=border,col=col))}
}
