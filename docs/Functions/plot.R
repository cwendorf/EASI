# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### Plot Functions

#### Plot Data

plotData <- function(...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data-2)),ceiling(max(data)+2))))
  xlimrange <- c(.5,ncol(data)+.5)
  mx <- ncol(data)+.15
  mn <- 1+.15
  par(bty="l",xaxs="i",yaxs="i")
  main="Data for the Variables"  
  ylab="Outcome"
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,jitter=0.08,col=col,pch=pch,cex.lab=1.3)
} 

plotData.formula <- function(formula,add=FALSE,method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y-2)),ceiling(max(y)+2))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  main="Data for the Groups"  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,jitter=0.08,col=col,pch=pch,cex.lab=1.3,...)
}

#### Add Data to Plot

addData <- function(...) 
  UseMethod("addData")

addData.default <- function(...,method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  mx <- ncol(data)+.15
  mn <- 1+.15
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col)
}

addData.formula <- function(formula,method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col,...)
}

#### Basic Confidence Interval Plot Functions

cipMeans <- function(results,main,ylab,xlab,mu,rope,values,digits) {
  ylimrange <- range(pretty(c(floor(min(results[,"LL"]-.4)),ceiling(max(results[,"UL"])+.4))))
  plot(results[,"M"],xaxs="i",yaxs="i",xaxt="n",xlim=c(.5,nrow(results)+.5),ylim=ylimrange,xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,1:nrow(results),row.names(results))
  results <- formatFrame(results,digits=digits)
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  if(values) {
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"M"][i]),results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"LL"][i]),results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"UL"][i]),results[,"UL"][i],cex=.8,pos=2,offset=.5)}
  if(!is.null(mu)) {abline(h=mu,lty=2)}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=rgb(.5,.5,.5,.07),border=NA)}   
}

cipDifference <- function(results,main,ylab,xlab,rope,values,digits) {
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  graphrope <- rope+as.vector(results[1,1])
  ylimrange <- range(pretty(c(floor(min(graph[,2]-.4)),ceiling(max(graph[,3])+.4))))
  par(mar=c(5,5,5,5))  
  plot(c(1,2,3),graph[,1],xaxt="n",yaxt="n",xaxs="i",yaxs="i",xlim=c(.4,3.6),ylim=ylimrange,pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="n")
  axis(1,.4:2.4,labels=FALSE,lwd.tick=0)
  axis(1,2.6:3.6,labels=FALSE,lwd.tick=0)
  axis(1,at=c(1,2),labels=rownames(graph)[1:2])
  axis(1,at=3,labels=rownames(graph)[3])
  axis(2)
  axis(2,at=ylimrange,labels=FALSE,lwd.tick=0)
  results <- formatFrame(results,digits=digits)
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2)
  if(values) {
  for (i in 1:2) text(i,graph[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,1][3],results[,1][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,2][3],results[,2][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,3][3],results[,3][3],cex=.8,pos=4,offset=.5)}
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  mtext("Mean Difference",side=4,las=3,cex=1.3,line=3)
  if(!is.null(rope)) {rect(2.6,graphrope[1],3.6,graphrope[2],col=rgb(.5,.5,.5,.07),border=NA)} 
}

#### Plot Function for Confidence Intervals of the Means

plotMeans <- function(...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(DescStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level)
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,"M"],i+1,results[i+1,"M"],code=3,length=0,lty=1)}
}

plotMeans.bss <- function(DescStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level)
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
}

plotMeans.default <- function(...,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  plotMeans(DescStats,ylab=ylab,xlab=xlab,conf.level=conf.level,mu=mu,rope=rope,values=values,digits=digits)
}

plotMeans.formula <- function(formula,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  plotMeans(DescStats,ylab=ylab,xlab=xlab,conf.level=conf.level,mu=mu,rope=rope,values=values,digits=digits)
}

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(CompStats,CorrStats,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Comparison"
  Vars <- ciMeans(CompStats,conf.level=conf.level)[1:2,c(2,5,6)]
  colnames(Vars) <- c("Est","LL","UL")
  Diff <- ciDifference(CompStats,CorrStats,conf.level=conf.level)[c(1,4,5)]
  colnames(Diff) <- c("Est","LL","UL")
  results <- rbind(Vars,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotDifference.bss <- function(CompStats,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Comparison"
  Groups <- ciMeans(CompStats,conf.level=conf.level)[1:2,c(2,5,6)]
  colnames(Groups) <- c("Est","LL","UL")
  Diff <- ciDifference(CompStats,conf.level=conf.level)[c(1,4,5)]
  colnames(Diff) <- c("Est","LL","UL")
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
}

plotDifference.default <- function(...,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  plotDifference(CompStats,CorrStats,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

plotDifference.formula <- function(formula,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,lables=NULL,values=TRUE,digits=3,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  plotDifference(CompStats,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.wss <- function(...,contrast,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  main="Confidence Intervals for the Contrast"
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- ciContrast(...,contrast=convar1,conf.level=conf.level)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- ciContrast(...,contrast=convar2,conf.level=conf.level)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- ciContrast(...,contrast=contrast,conf.level=conf.level)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotContrast.bss <- function(DescStats,contrast,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Contrast"
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(DescStats,contrast=congrp1,conf.level=conf.level)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(DescStats,contrast=congrp2,conf.level=conf.level)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(DescStats,contrast=contrast,conf.level=conf.level)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
}

plotContrast.default <- function(...,contrast,ylab="Outcome",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  plotContrast(DescStats,CorrStats,contrast=contrast,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

plotContrast.formula <- function(formula,contrast,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  plotContrast(DescStats,contrast=contrast,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

#### Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- plotPairwise.bss <- plotPairwise.wss <- function(...,ylab="Mean Difference",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3) {
  main="Confidence Intervals for the Pairwise Comparisons"
  results <- ciPairwise(...,conf.level=conf.level)
  colnames(results)[1] <- "M"  
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits) 
}

plotPairwise.formula <- function(formula,ylab="Mean Difference",xlab="",conf.level=.95,mu=NA,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  results <- ciPairwise(formula,conf.level=conf.level)
  colnames(results)[1] <- "M"
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits) 
}


### Add Relational Intervals to Existing CI Plot

addRelational <- function(...) 
  UseMethod("addRelational")

addRelational.wss <- function(DescStats,CorrStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- ciRelational(DescStats,CorrStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.bss <- function(DescStats,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...) {
  results <- ciRelational(DescStats,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.default <- function(...,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4)){
  results <- ciRelational(...,conf.level=conf.level)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

addRelational.formula <- function(formula,conf.level=.95,mu=NA,col=rgb(.5,.5,.5,.4),...){
  results <- ciRelational(formula,conf.level=conf.level,...)
  for (i in 1:nrow(results)) rect(i-.05,results[,4][i],i+.05,results[,5][i],col=col,border=NA)
}

### Plot Confidence and Relational Intervals

plotRelational <- function(...) 
  UseMethod("plotRelational")

plotRelational.wss <- function(DescStats,CorrStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(DescStats,CorrStats,conf.level=conf.level,...)
}

plotRelational.bss <- function(DescStats,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(DescStats,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(DescStats,conf.level=conf.level,...)
}

plotRelational.default <- function(...,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(...,conf.level=conf.level)
}

plotRelational.formula <- function(formula,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  main="Confidence and Relational Intervals for the Means"
  results <- ciMeans(formula,conf.level=conf.level,...)[,c(2,5,6)]
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  addRelational(formula,conf.level=conf.level,...)
}
