# Estimation Approach to Statistical Inference
## Functions for Medians and Boxplots

### Descriptive Functions

#### Describe Function for Medians

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

#### Boxplot Functions

.vio <- function(var,loc,offset=0,scale=.6,border="gray75",col="gray90") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border=border,col=col)
}

.halfvio <- function(var,loc,offset=0,scale=.6,border="gray75",col="gray90") {
  y <- density(var)
  y1 <- loc+(y$y*scale)+offset
  y2 <- loc-(y$y*scale)+offset
  polygon(c(y1,seq(from=loc+offset,to=loc+offset,length.out=length(y2))),c(y$x,rev(y$x)),border=border,col=col)
}

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

.dots <- function(var,loc,offset=0,jitter=0,col="gray0",pch=16) {
  newx <- NULL
  for(i in 1:length(var)) {newx[i] <- loc+runif(1,min=-(jitter/2),max=(jitter/2))+offset}
  points(newx,var,col=col,pch=pch)
}

.bplabels <- function(var,loc,offset=0,col="black") {
  z <- .unformatFrame(describeBoxes(var)[[1]])
for (i in 1:ncol(z)) text(loc+offset,z[i],z[i],cex=.8,col=col)  
}

plotBoxes <- function(x,...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,main=NULL,ylab="Outcome",xlab="",ylim=NULL) {
  if(is.null(main)) {main="Violin Plots for the Variables"}
  data <- data.frame(...)
  if(is.null(ylim)) {
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  vars <- colnames(data)
  nvars <- length(data)
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim,cex.lab=1.3)
  axis(1,1:nvars,vars)
  for(i in 1:nvars) {.vio(data[,i],i)}
  for(i in 1:nvars) {.bp(data[,i],i)}  
} 

plotBoxes.formula <- function(formula,main=NULL,ylab="Outcome",xlab="",ylim=NULL) {
  if(is.null(main)) {main="Violin Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  if(is.null(ylim)) {
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))}
  groups <- levels(group)
  ngroups <- nlevels(group)
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim,cex.lab=1.3)
  axis(1,1:ngroups,groups)
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.vio(outcome,i))}
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.bp(outcome,i))}
}
