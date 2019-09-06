# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences

### Confidence Interval Plot Functions

#### Basic Plot Functions

cipMeans <- function(results,main,ylab,xlab,mu){
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  results <- format(as.data.frame(results),trim=T,nsmall=3)
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,1][i]),results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,2][i]),results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,as.numeric(results[,3][i]),results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

cipDifference <- function(results,main,ylab,xlab){
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,2])/2)*2,ceiling(max(graph[,3])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(graph))
  results <- format(as.data.frame(results),trim=T,nsmall=3)
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2)
  for (i in 1:2) text(i,graph[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,1][3],results[,1][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,2][3],results[,2][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,3][3],results[,3][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

#### Plot Function for Confidence Intervals for the Means of Levels

plotMeans <- function(...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(sumstats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}

plotMeans.bss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeans(sumstats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}
plotMeans.default <- function(...,mu=NULL,conf.level=.95){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}

plotMeans.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- ciMeans(formula,...)[,c(2,5,6)]
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  cipMeans(results,main,ylab,xlab,mu)
}
 
#### Plot Function for Confidence Intervals of a Mean Difference/Comparison of Levels

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(compstats,corrstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Groups <- ciMeans(compstats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(compstats,corrstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.bss <- function(compstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Groups"
  Groups <- ciMeans(compstats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(compstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars <- ciMeans(...)[2:1,c(2,5,6)]
  Diff <- ciDifference(...)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups <- ciMeans(formula,...)
  Groups <- Groups[2:1,c(2,5,6)]
  Diff <- ciDifference(formula,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.wss <- function(...,contrast,labels=NULL){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Variables"
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- ciContrast(...,contrast=convar1)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- ciContrast(...,contrast=convar2)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- ciContrast(...,contrast=contrast)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- labels}
  cipDifference(results,main,ylab,xlab)  
}

plotContrast.bss <- function(sumstats,contrast,labels=NULL,...){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Groups"
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(sumstats,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(sumstats,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(sumstats,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- labels}
  cipDifference(results,main,ylab,xlab)
}

plotContrast.default <- function(...,contrast,labels=NULL){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Variables"
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- ciContrast(...,contrast=convar1)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- ciContrast(...,contrast=convar2)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- ciContrast(...,contrast=contrast)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- labels}
  cipDifference(results,main,ylab,xlab)  
}

plotContrast.formula <- function(formula,contrast,labels=NULL,...){
  main="Confidence Intervals for the Contrast"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(formula,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(formula,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(formula,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- labels}
  cipDifference(results,main,ylab,xlab)
}
