# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### TO INSTALL: PASTE CONTENTS OF THIS ENTIRE FILE INTO R 

### Data Functions

#### Describe Function for Mutiple Groups and Variables

descData <- function(...) 
  UseMethod("descData")

descData.default <- function(...) {
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- round(cbind(N=N,M=M,SD=SD),3)
  return(results)
}

descData.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=descData,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

describeData <- function(...) {
  cat("\nDESCRIPTIVE STATISTICS FOR THE DATA\n\n")
   print(descData(...))
  cat("\n")
}

#### Correlate/Covary Function for Mutiple Variables

corrData <- function(...) 
  UseMethod("corrData")

corrData.default <- function(...,mu=0,conf.level=.95) {
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

correlateData <- function(...) {
  cat("\nCORRELATION MATRIX FOR THE DATA\n\n")
   print(corrData(...))
  cat("\n")
}

cor2cov <- function(CorrStats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * CorrStats
  return(covstats)
}

#### Declare and Fill Blanks in Matrix

declareCorrMatrix <- function(...) {
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrMatrix <- function(mat) {
  nr <- nrow(mat)
  nc <- ncol(mat)
  rn <- rownames(mat)
  cn <- colnames(mat)
  results <- matrix(data=NA,nr,nc)
  rownames(results) <- rn
  colnames(results) <- cn
  for( i in 1:nr ){
  for( j in 1:nc ){
	if(!is.na(mat[rn[i],cn[j]])) {
		if(mat[rn[i],cn[j]] == results[cn[j],rn[i]] | is.na(results[cn[j],rn[i]])){
			results[cn[j],rn[i]] <- mat[rn[i],cn[j]]
			results[rn[i],cn[j]] <- mat[rn[i],cn[j]]
		}
		else {return("error")}
	}
  }
  }
  diag(results) <- 1.000
  return(results)
}

### Confidence Interval Functions

#### CI Function for Means

ciMeans <- function(...) 
  UseMethod("ciMeans")

ciMeans.wss <- ciMeans.bss <- function(DescStats,conf.level=.95,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- as.data.frame(round(cbind(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3))
  rownames(results) <- rownames(DescStats)
  return(results)
}

ciMeans.default <- function(...,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

ciMeans.formula <- function(formula,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

estimateMeans <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
   print(format(as.data.frame(ciMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

#### CI Function for Mean Differences/Comparisons

ciDifference <- function(...) 
  UseMethod("ciDifference")
  
ciDifference.wss <- function(CompStats,CorrStats,conf.level=.95,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[1]-M[2]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.bss <- function(CompStats,conf.level=.95,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[1]-M[2]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.default <- function(...,conf.level=.95) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- ciDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciDifference.formula <- function(formula,conf.level=.95,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  results <- ciDifference(CompStats,conf.level=conf.level)
  return(results)
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(format(as.data.frame(ciDifference(...)),trim=T,nsmall=3))
  cat("\n")  
}

#### CI Function for Mean Contrasts

ciContrast <- function(...) 
  UseMethod("ciContrast")

ciContrast.wss <- function(DescStats,CorrStats,contrast,conf.level=.95,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cor2cov(CorrStats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.bss <- function(DescStats,contrast,conf.level=.95,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.default <- function(...,contrast,mu=0,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- ciContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

ciContrast.formula <- function(formula,contrast,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- ciContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(format(as.data.frame(ciContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}

### Confidence Interval Plot Functions

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

### Add Data to Plot

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

cipMeans <- function(results,main,ylab,xlab,mu,rope,values) {
  ylimrange <- range(pretty(c(floor(min(results[,2]-2)),ceiling(max(results[,3])+2))))
  plot(results[,1],xaxs="i",yaxs="i",xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=ylimrange,xlab="",cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  results <- format(as.data.frame(results),trim=T,nsmall=3)
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  if(values) {
  for (i in 1:nrow(results)) text(i,as.numeric(results[,1][i]),results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,2][i]),results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,as.numeric(results[,3][i]),results[,3][i],cex=.8,pos=2,offset=.5)}
  if(!is.null(mu)) {abline(h=mu,lty=2)}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=rgb(.5,.5,.5,.07),border=NA)}   
}

cipDifference <- function(results,main,ylab,xlab,rope,values) {
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  graphrope <- rope+as.vector(results[1,1])
  ylimrange <- range(pretty(c(floor(min(graph[,2]-2)),ceiling(max(graph[,3])+2))))
  par(mar=c(5,5,5,5))  
  plot(c(1,2,3),graph[,1],axes=FALSE,xaxs="i",yaxs="i",xaxt="n",xlim=c(.4,3.6),ylim=ylimrange,pch=c(15,15,17),cex=1.5,xlab="",ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,.4:2.4,labels=FALSE,lwd.tick=0)
  axis(1,2.6:3.6,labels=FALSE,lwd.tick=0)
  axis(1,at=c(1,2),labels=rownames(graph)[1:2])
  axis(1,at=3,labels=rownames(graph)[3])
  axis(2)
  results <- format(as.data.frame(results),trim=T,nsmall=3)
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

plotMeans.wss <- function(DescStats,mu=NULL,rope=NULL,values=TRUE,...) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(DescStats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu,rope,values)
  for (i in 1:(nrow(results)-1)) arrows(i,results[i,1],i+1,results[i+1,1],code=3,length=0,lty=1)  
}

plotMeans.bss <- function(DescStats,mu=NULL,rope=NULL,values=TRUE,...) {
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeans(DescStats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu,rope,values)
}

plotMeans.default <- function(...,mu=NULL,rope=NULL,conf.level=.95,values=TRUE) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  plotMeans(DescStats,conf.level=conf.level,mu=mu,rope=rope,values=values)
}

plotMeans.formula <- function(formula,mu=NULL,rope=NULL,conf.level=.95,values=TRUE,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  plotMeans(DescStats,conf.level=conf.level,mu=mu,rope=rope,values=values)
}

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(CompStats,CorrStats,rope=NULL,values=TRUE,...) {
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Groups <- ciMeans(CompStats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(CompStats,CorrStats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab,rope,values)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotDifference.bss <- function(CompStats,rope=NULL,values=TRUE,...) {
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Groups"
  Groups <- ciMeans(CompStats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(CompStats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab,rope,values)
}

plotDifference.default <- function(...,conf.level=.95,rope=NULL,labels=NULL,values=TRUE) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  plotDifference(CompStats,CorrStats,conf.level=conf.level,rope=rope,labels=labels,values=values)
}

plotDifference.formula <- function(formula,conf.level=.95,rope=NULL,lables=NULL,values=TRUE,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  plotDifference(CompStats,conf.level=conf.level,rope=rope,labels=labels,values=values)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.wss <- function(...,contrast,rope=NULL,labels=NULL,values=TRUE) {
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
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main,ylab,xlab,rope,values)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotContrast.bss <- function(DescStats,contrast,rope=NULL,labels=NULL,values=TRUE,...) {
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Groups"
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(DescStats,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(DescStats,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(DescStats,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main,ylab,xlab,rope,values)
}

plotContrast.default <- function(...,contrast,conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  plotContrast(DescStats,CorrStats,contrast=contrast,conf.level=conf.level,rope=rope,labels=labels,values=values)
}

plotContrast.formula <- function(formula,contrast,conf.level=.95,rope=NULL,labels=NULL,values=TRUE,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  plotContrast(DescStats,contrast=contrast,conf.level=conf.level,rope=rope,labels=labels,values=values)
}

### Standardized Mean Difference Functions

#### SMD Function for Means

smdMeans <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(DescStats,mu=0,conf.level=.95,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)  
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  alpha <- 1-conf.level
  CD <- Diff/SD
  CDU <- (1-3/(4*df-1))*CD
  SE <- sqrt((df+2)/(N^2)+((CD^2)/(2*(df+2))))
  k <- exp(((log(2)-log(df))/2)+lgamma((df+1)/2)-lgamma(df/2))
  m <- t*k
  v <- 1+(t^2)*(1-k^2)
  w <- (2*m^3)-((2*df-1)/df)*(t^2*m)
  skew <- abs(w/sqrt(v)^3)
  sdz <- sqrt(v)
  llz <- qnorm(1-alpha/2,lower.tail=FALSE)
  ulz <- qnorm(1-alpha/2)
  ll1 <- m+sdz*llz
  ul1 <- m+sdz*ulz
  c <- w/(4*v)
  q <- v/(2*c^2)
  a <- m-(q*c)
  llp <- 2*(qgamma(alpha/2,q/2,rate=1))
  ulp <- 2*(qgamma(1-alpha/2,q/2,rate=1))
  ll2 <- ifelse(t>0,a+c*llp,a+c*ulp)
  ul2 <- ifelse(t>0,a+c*ulp,a+c*llp)
  LL <- ifelse(skew<.001,ll1*sqrt(1/N),ll2*sqrt(1/N))
  UL <- ifelse(skew<.001,ul1*sqrt(1/N),ul2*sqrt(1/N))
  results <- round(cbind(d=CD,"d(unb)"=CDU,SE=SE,LL=LL,UL=UL),3)
  rownames(results) <- rownames(DescStats)
  return(results)
}

smdMeans.default <- function(...,mu=0,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

smdMeans.formula <- function(formula,mu=0,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

standardizeMeans <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(format(as.data.frame(smdMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

#### SMD Function for Mean Differences/Comparisons

smdDifference <- function(...) 
  UseMethod("smdDifference")

smdDifference.wss <- function(DescStats,CorrStats,conf.level=.95,...) {
  CompStats <- DescStats[1:2,]
  N <- min(CompStats[1:2,"N"])
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.bss <- function(DescStats,contrast,conf.level=.95,...) {
  CompStats <- DescStats[1:2,]
  N <- CompStats[1:2,"N"]
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.default <- function(...,conf.level=.95) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- smdDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,contrast,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdDifference(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeDifference <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON\n\n")
  print(format(as.data.frame(smdDifference(...)),trim=T,nsmall=3))
  cat("\n")  
}

#### SMD Function for Mean Contrasts

smdContrast <- function(...) 
  UseMethod("smdContrast")

smdContrast.wss <- function(DescStats,CorrStats,contrast,conf.level=.95,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  R <- mean(CorrStats[upper.tri(CorrStats)])
  df <- N-1
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  a <- length(M)
  s <- sqrt(sum(SD^2)/a)
  Est <- (t(contrast)%*%M)/s
  v1 <- Est^2/(2*a^2*s^4*df)
  v2 <- sum(SD^4)
  v3 <- R^2*t(SD^2)%*%SD^2 
  v4 <- sum(contrast^2*SD^2)
  v5 <- R*t(contrast*SD)%*%(contrast*SD)
  SE <- sqrt(v1*(v2+v3)+(v4-v5)/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.bss <- function(DescStats,contrast,conf.level=.95,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v <- SD^2
  a <- length(M)
  s <- sqrt(sum(v)/a)
  Est <- (t(contrast)%*%M)/s
  a1 <- Est^2/(a^2*s^4)
  a2 <- a1*sum((v^2/(2*(N-1))))
  a3 <- sum((contrast^2*v/(N-1)))/s^2
  SE <- sqrt(a2+a3)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.default <- function(...,contrast,mu=0,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- smdContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

smdContrast.formula <- function(formula,contrast,conf.level=.95,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- smdContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeContrast <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST\n\n")
  print(format(as.data.frame(smdContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Means

nhstMeans <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(DescStats,mu=0,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- rownames(DescStats)  
  return(results)
}

nhstMeans.default <- function(...,mu=0) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

testMeans <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(format(as.data.frame(nhstMeans(...)),trim=T,nsmall=3))
  cat("\n")
}

##### NHST Function for Mean Differences/Comparisons

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(CompStats,CorrStats,mu=0,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[1]-M[2]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)  
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.bss <- function(CompStats,mu=0,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[1]-M[2]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.default <- function(...,mu=0) {
  CompStats <- descData(...)
  class(CompStats) <- "wss"
  CorrStats <- corrData(...)
  results <- nhstDifference(CompStats,CorrStats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,...) {
  CompStats <- descData(formula)
  class(CompStats) <- "bss"
  results <- nhstDifference(CompStats,mu=mu)
  return(results)
}

testDifference <- function(...) {
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(format(as.data.frame(nhstDifference(...)),trim=T,nsmall=3))
  cat("\n")
}

#### NHST Function for Mean Contrasts

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(DescStats,contrast,mu=0,...) {
  N=DescStats[,"N"]
  M=DescStats[,"M"]
  SD=DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  covstats <- cor2cov(CorrStats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.default <- function(...,contrast,mu=0,conf.level=.95) {
  DescStats <- descData(...)
  class(DescStats) <- "wss"
  CorrStats <- corrData(...)
  results <- nhstContrast(DescStats,CorrStats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,...) {
  DescStats <- descData(formula)
  class(DescStats) <- "bss"
  results <- nhstContrast(DescStats,contrast,mu=mu)
  return(results)
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(format(as.data.frame(nhstContrast(...)),trim=T,nsmall=3))
  cat("\n")  
}
