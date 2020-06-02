# Estimation Approach to Statistical Inference
## Functions for Medians and Boxplots

### Descriptive Functions

#### Describe Function for Medians

.descBoxes <- function(x,...)
  UseMethod(".descBoxes")

.descBoxes.default <- function(x,...) {
  data <- data.frame(...)
  results <- do.call(rbind,lapply(data,function(x) boxplot.stats(x)$stats))
  results <- round(results,3)
  colnames(results) <- c("Min","LQ","Mdn","UQ","Max")
  return(results)
}

.descBoxes.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=.descBoxes,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("Min","LQ","Mdn","UQ","Max")
  return(results)
}

describeBoxes <- function(...,main=NULL,digits=3) {
  results <- .formatList(list(.descBoxes(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}
  return(results)
}

### Plot Functions

#### Boxplot Functions

.bpvio <- function(var,loc,offset=0,scale=.6) {
y=density(var)
y1=loc+(y$y*scale)+offset
y2=loc-(y$y*scale)+offset
polygon(c(y1,rev(y2)),c(y$x,rev(y$x)),border="gray75",col="gray90")
z=.descBoxes(var)
arrows(loc+offset,z[1],loc+offset,z[5],length=0,lty=2)
rect(loc+offset-.06,z[2],loc+offset+.06,z[4],col="white",lwd=1)
arrows(loc+offset-.06,z[3],loc+offset+.06,z[3],length=0,lwd=2)
arrows(loc+offset-.03,z[1],loc+offset+.03,z[1],length=0,lwd=1)
arrows(loc+offset-.03,z[5],loc+offset+.03,z[5],length=0,lwd=1)
}

plotBoxes <- function(...) 
  UseMethod("plotBoxes")

plotBoxes.default <- function(...,main=NULL,ylab="Outcome",xlab="") {
  if(is.null(main)) {main="Violin Plots for the Variables"}
  data <- data.frame(...)
  z <- lapply(data,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))
  vars <- colnames(data)
  nvars <- length(data)
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,nvars+.5),ylim=ylim)
  axis(1,1:nvars,vars)
  for(i in 1:nvars) {.bpvio(data[,i],i)}
} 

plotBoxes.formula <- function(formula,main=NULL,ylab="Outcome",xlab="") {
  if(is.null(main)) {main="Violin Plots for the Groups"}
  group <- eval(formula[[3]])
  outcome <- eval(formula[[2]])
  data <- data.frame(group,outcome)
  z <- tapply(outcome,group,FUN=function(x) cbind(x=density(x)$x,y=density(x)$y))
  mn <- min(sapply(z,`[`,1,1))
  mx <- max(sapply(z,`[`,,1))
  ylim <- range(pretty(c(mn,mx)))
  groups <- levels(group)
  ngroups <- nlevels(group)
  plot(NULL,bty="l",xaxt="n",main=main,xlab=xlab,ylab=ylab,xlim=c(.5,ngroups+.5),ylim=ylim)
  axis(1,1:ngroups,groups)
  for(i in 1:ngroups) {with(subset(data,group==groups[i]),.bpvio(outcome,i))}
}